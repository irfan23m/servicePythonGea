from typing import Dict, Text, Any, List, Union, Optional

from rasa_sdk import Tracker, Action
from rasa_sdk.events import SlotSet
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.forms import FormAction

from connect_mysql import select, insert

import requests

class EmaskuForm(FormAction):
    def name(self) -> Text:
        return "emasku_form"
    
    @staticmethod
    def list_berat() -> List[Text]:
        list_berat = []
        query = "SELECT berat FROM uang_muka_emasku"
        result = select(query)
        for i in result:
            list_berat.append(str(int(i[0])))
        return list_berat

    @staticmethod
    def list_tenor() -> List[Text]:
        max_tenor = 12
        list_tenor = [str(i) for i in range(1,max_tenor+1)]
        return list_tenor

    @staticmethod
    def required_slots(tracker: Tracker) -> List[Text]:
        return ["berat_emasku", "tenor_emasku"]

    def slot_mappings(self) -> Dict[Text, Union[Dict, List[Dict]]]:
        return {
            "berat_emasku": [
                self.from_entity(entity="berat_emasku")],
            "tenor_emasku": self.from_entity(
                    entity="tenor_emasku", intent="inform")
        }
    
    def validate_berat_emasku(
        self,
        value: Any,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: Dict[Text, Any],
    ) -> Dict[Text, Any]:
        if str(value)[:2]=="b-":
            berat_emasku = str(value)[3:]
        else:
            berat_emasku = str(int(value))
        if berat_emasku in self.list_berat():
            return {"berat_emasku": berat_emasku}
        else:
            dispatcher.utter_message(template="utter_berat_emasku_salah")
            return {"berat_emasku": None}

    def validate_tenor_emasku(
        self,
        value: Any,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: Dict[Text, Any],
    ) -> Dict[Text, Any]:
        tenor_emasku = str(value)[4:]
        if tenor_emasku in self.list_tenor():
            return {"tenor_emasku": tenor_emasku}
        else:
            dispatcher.utter_message(template="utter_tenor_emasku_salah")
            return {"tenor_emasku": None}

    def submit(
        self,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: Dict[Text, Any],
    ) -> List[Dict]:
        berat_emasku = tracker.get_slot("berat_emasku")
        tenor_emasku = tracker.get_slot("tenor_emasku")
        query_harga = select("SELECT beli FROM harga_emas WHERE tanggal = DATE(NOW())")
        harga = float(query_harga[0][0])
        query_dp = select("SELECT uang_muka FROM uang_muka_emasku WHERE berat='"+ str(int(berat_emasku)) +"' ")
        dp = float(query_dp[0][0])
        total_harga = (float(berat_emasku) * harga) + dp
        angsuran = total_harga / int(tenor_emasku)

        message = f"""
        Harga emas hari ini\t: Rp {harga:,} /gram \n
        Berat emas diminta\t: {berat_emasku} gram \n
        Besar uang muka\t: Rp {dp:,} \n
        Tenor yang diminta\t: {tenor_emasku} bulan
        Total pembiayaan\t: (Rp {harga:,} x {berat_emasku}) + Rp {dp:,} = Rp {total_harga:,} \n
        BESAR ANGSURAN\t: Rp {total_harga:,} : {tenor_emasku} = Rp {angsuran:,} / bulan
        """ 
        dispatcher.utter_message(message)
        
        query_insert = f"""
        INSERT INTO list_tanya VALUES 
        (NOW(), 'SIMULASI', 'EMASKU', 'BERAT', '{berat_emasku}'),
        (NOW(), 'SIMULASI', 'EMASKU', 'TENOR', '{tenor_emasku}')
        """
        insert(query_insert)
        return [SlotSet("berat_emasku", None), SlotSet("tenor_emasku", None)]