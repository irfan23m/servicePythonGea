from typing import Dict, Text, Any, List, Union, Optional

from rasa_sdk import Tracker, Action
from rasa_sdk.events import SlotSet
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.forms import FormAction

from connect_mysql import select, insert

class AmanahForm(FormAction):
    def name(self) -> Text:
        return "amanah_form"

    @staticmethod
    def required_slots(tracker: Tracker) -> List[Text]:
        if tracker.get_slot("tipe") in AmanahForm.list_tipe(tracker):
            return ["tipe", "uang_muka", "tenor_amanah"]
        elif tracker.get_slot("brand") in AmanahForm.list_brand(tracker):
            return ["brand", "tipe", "uang_muka", "tenor_amanah"]
        else:
            return ["kendaraan", "brand", "tipe", "uang_muka", "tenor_amanah"]

    def slot_mappings(self) -> Dict[Text, Union[Dict, List[Dict]]]:
        return {
            "kendaraan": [
                self.from_entity(entity="kendaraan", intent="inform"),
                self.from_entity(
                    entity="kendaraan", intent="simulasi_amanah"
                )],
            "brand": [
                self.from_entity(entity="brand", intent="inform"),
                self.from_entity(
                    entity="brand", intent="simulasi_amanah"
                )],
            "tipe": [
                self.from_entity(entity="tipe", intent="inform"),
                self.from_entity(
                    entity="tipe", intent="simulasi_amanah"
                )],
            "uang_muka": self.from_entity(entity="uang_muka", intent="inform"),
            "tenor_amanah": self.from_entity(entity="tenor_amanah", intent="inform")
        }

    @staticmethod
    def list_brand(tracker: Tracker) -> List[Text]:
        kendaraan = tracker.get_slot("kendaraan")
        if kendaraan != None:
            query = "SELECT DISTINCT brand FROM harga_kendaraan WHERE kendaraan='"+ kendaraan.upper() +"' "
        else:
            query = "SELECT DISTINCT brand FROM harga_kendaraan"
        result = select(query)
        list_brand = [str(i[0]) for i in result]
        return list_brand

    @staticmethod
    def list_tipe(tracker: Tracker) -> List[Text]:
        kendaraan = tracker.get_slot("kendaraan")
        brand = tracker.get_slot("brand")
        if (kendaraan != None) and (brand != None):
            query = "SELECT DISTINCT tipe FROM harga_kendaraan WHERE kendaraan='"+ kendaraan.upper() +"' AND brand= '"+ brand.upper() +"' "
        elif (kendaraan != None) and (brand == None):
            query = "SELECT DISTINCT tipe FROM harga_kendaraan WHERE kendaraan='"+ kendaraan.upper() +"' "
        else:
            query = "SELECT DISTINCT tipe FROM harga_kendaraan"
        result = select(query)
        list_tipe = [str(i[0]) for i in result]
        return list_tipe
    
    def validate_kendaraan(
        self,
        value: Any,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: Dict[Text, Any],
    ) -> Dict[Text, Any]:
        if str(value) in ["mobil", "motor"]:
            return {"kendaraan": str(value)}
        else:
            return {"kendaraan": None}
    
    def validate_brand(
        self,
        value: Any,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: Dict[Text, Any],
    ) -> Dict[Text, Any]:
        if str(value).upper() in self.list_brand(tracker):
            return {"brand": str(value)}
        else:
            list_brand = ", ".join(self.list_brand(tracker))
            kendaraan = tracker.get_slot("kendaraan")
            kendaraan = kendaraan if kendaraan != None else ""
            dispatcher.utter_message(template="utter_brand_amanah_salah",brand_tersedia=list_brand, brand_salah=str(value), kendaraan=kendaraan)
            return {"brand": None}

    def validate_tipe(
        self,
        value: Any,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: Dict[Text, Any],
    ) -> Dict[Text, Any]:
        tipe = str(value).upper()
        kendaraan = tracker.get_slot("kendaraan")
        kendaraan = kendaraan if kendaraan != None else ""
        if tipe in self.list_tipe(tracker):
            return {"tipe": tipe}
        else:
            list_tipe = ", ".join(self.list_tipe(tracker))
            dispatcher.utter_message(template="utter_tipe_amanah_salah", tipe_salah=tipe, tipe_tersedia=list_tipe, kendaraan=kendaraan)
            return {"tipe": None}

    def validate_uang_muka(
        self,
        value: Any,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: Dict[Text, Any],
    ) -> Dict[Text, Any]:
        tipe = tracker.get_slot("tipe")
        query_harga = select("SELECT harga FROM harga_kendaraan WHERE tipe = '"+ str(tipe).upper() +"' ") 
        harga = float(query_harga[0][0])
        query_dp = select("SELECT b.uang_muka FROM harga_kendaraan a JOIN plafon_uang_muka b ON a.negara = b.negara AND a.kendaraan = b.kendaraan WHERE a.tipe = '"+ tipe.upper() +"' ")
        dp_min = float(query_dp[0][0]) * harga
        if float(value) >= dp_min and float(value) <harga :
            return {"uang_muka": value}
        else:
            dispatcher.utter_message(template="utter_uang_muka_salah", depe_min=f"{dp_min:,}", harga=f"{harga:,}")
            return {"uang_muka": None}

    def validate_tenor_amanah(
        self,
        value: Any,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: Dict[Text, Any],
    ) -> Dict[Text, Any]:
        tenor = str(value)[4:]
        tipe = tracker.get_slot("tipe")
        query_kendaraan = select("SELECT kendaraan FROM harga_kendaraan WHERE tipe = '"+ tipe.upper() +"' ") 
        kendaraan = str(query_kendaraan[0][0])
        tenor_amanah = ["12", "18", "24", "36", "48", "60"] if kendaraan == "MOBIL" else ["12", "18", "24", "36"]
        list_tenor = ", ".join(tenor_amanah)
        if tenor in tenor_amanah:
            return {"tenor_amanah": tenor}
        else:
            dispatcher.utter_message(template="utter_tenor_amanah_salah", list_tenor=list_tenor, kendaraan=kendaraan)
            return {"tenor_amanah": None}
    
    def submit(
        self,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: Dict[Text, Any],
    ) -> List[Dict]:
        tipe = tracker.get_slot("tipe")
        uang_muka = tracker.get_slot("uang_muka")
        tenor = tracker.get_slot("tenor_amanah")
        query_harga = select("SELECT harga FROM harga_kendaraan WHERE tipe = '"+ tipe.upper() +"' ") 
        harga = float(query_harga[0][0])
        up = harga - float(uang_muka)
        plafon = (up / harga ) * 100
        query_diskon = select("SELECT rate FROM diskon_bunga WHERE min <= '"+ str(plafon) +"' and max >= '"+ str(plafon) +"' ")
        diskon_bunga = float(query_diskon[0][0]) / 100
        bunga_awal = 0.009 * harga * int(tenor)
        bunga_bersih = (1 - diskon_bunga) * bunga_awal
        total_angsuran = up + bunga_bersih
        pokok_bulan = up / int(tenor)
        bunga_bulan = bunga_bersih / int(tenor)
        angsuran_bulan = total_angsuran / int(tenor)

        message = f"""
        Harga Taksiran\t: Rp {harga:,.2f}\n
        Uang Muka     \t: Rp {float(uang_muka):,.2f}\n
        Uang Pinjaman \t: Rp {up:,.2f}\n
        Tenor         \t: {tenor} bulan\n
        Mu'nah Awal   \t: 0.9% x Rp {harga:,.2f} x {tenor}\n
                      \t: Rp {bunga_awal:,.2f} \n
        Diskon Mu'nah \t: {query_diskon[0][0]}% x Rp {bunga_awal:,.2f} \n
                      \t: Rp {diskon_bunga*bunga_awal:,.2f} \n
        Mu'nah Bersih \t: Rp {bunga_awal:,.2f} - Rp {diskon_bunga*bunga_awal:,.2f} \n
                      \t: Rp {bunga_bersih:,.2f} \n
        Total Biaya   \t: Rp {up:,.2f} + Rp {bunga_bersih:,.2f}\n
                      \t: Rp {total_angsuran:,.2f} \n
        \n
        Pokok Bulanan \t: Rp {up:,.2f} / {tenor} bulan\n
                      \t: Rp {pokok_bulan:,.2f} /bulan\n
        Mu'nah Bulanan\t: Rp {bunga_bersih:,.2f} / {tenor} bulan\n
                      \t: Rp {bunga_bulan:,.2f} /bulan\n
        ANGSURAN BULANAN: Rp {pokok_bulan:,.2f} + Rp {bunga_bulan:,.2f}\n
                      \t: Rp {angsuran_bulan:,.2f} /bulan\n
        """
        dispatcher.utter_message(message)
        return [SlotSet("kendaraan", None), SlotSet("brand", None), SlotSet("tipe", None), SlotSet("uang_muka", None), SlotSet("tenor_amanah", None)]
