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
    def required_slots(tracker: Tracker) -> List[Text]:
        return ["berat_emasku"]

    def slot_mappings(self) -> Dict[Text, Union[Dict, List[Dict]]]:
        return {
            "berat_emasku": [
                self.from_entity(entity="berat_emasku"),
                self.from_entity(entity="berat", intent="simulasi_emasku"),
                ]
        }
    
    def validate_berat_emasku(
        self,
        value: Any,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: Dict[Text, Any],
    ) -> Dict[Text, Any]:
        if str(value)[:2]=="b-":
            berat_emasku = float(str(value)[3:])
        else:
            berat_emasku = value
        if str(int(berat_emasku)) in self.list_berat():
            return {"berat_emasku": str(int(berat_emasku))}
        else:
            dispatcher.utter_message(template="utter_berat_emasku_salah")
            return {"berat_emasku": None}

    def submit(
        self,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: Dict[Text, Any],
    ) -> List[Dict]:
        berat_emasku = tracker.get_slot("berat_emasku")
        query_harga = select("SELECT beli FROM harga_emas WHERE tanggal = DATE(NOW())")
        harga = float(query_harga[0][0])
        query_dp = select("SELECT uang_muka FROM uang_muka_emasku WHERE berat='"+ str(int(berat_emasku)) +"' ")
        dp = float(query_dp[0][0])
        total_harga = (float(berat_emasku) * harga) - dp
        angsuran = total_harga / 12

        message = f"""
        Harga emas hari ini\t: Rp {harga:,} /gram \n
        Berat emas diminta\t: {berat_emasku} gram \n
        Tenor angsuran\t: 12 bulan \n
        Total pembiayaan\t: (Rp {harga:,} x {berat_emasku}) - Rp {dp:,} = Rp {total_harga:,} \n
        BESAR ANGSURAN\t: Rp {total_harga:,} : 12 bulan = Rp {angsuran:,} / bulan \n
        BESAR UANG MUKA\t: Rp {dp:,}
        """ 
        dispatcher.utter_message(message)
        
        query_insert = f"""
        INSERT INTO list_tanya VALUES 
        (NOW(), 'SIMULASI', 'EMASKU', 'BERAT', '{berat_emasku}')
        """
        insert(query_insert)
        return [SlotSet("berat_emasku", None)]