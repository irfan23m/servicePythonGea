from typing import Dict, Text, Any, List, Union, Optional

from rasa_sdk import Tracker, Action
from rasa_sdk.events import SlotSet
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.forms import FormAction

from connect_mysql import select, insert

import requests

class HargaEmas(Action):
    def name(self):
        return "actions_harga_emas"
    
    def run(self, dispatcher, tracker, domain):
        berat = tracker.get_slot("berat")
        unit = tracker.get_slot("unit")

        # url = ""
        # result = requests.get(url)
        # harga_jual = result.json()['']
        # harga_beli = result.json()['']

        query_jual = select("SELECT jual FROM harga_emas WHERE tanggal = DATE(NOW())")
        harga_jual = float(query_jual[0][0])
        query_beli = select("SELECT beli FROM harga_emas WHERE tanggal = DATE(NOW())")
        harga_beli = float(query_beli[0][0])


        if (berat == None or berat == 0.0) :
            total_jual = harga_jual
            total_beli = harga_beli
            berat = 1
            unit = "gram"
            query_insert = "INSERT INTO list_tanya VALUES (NOW(), 'HARGA_EMAS', 'TABUNGAN_EMAS', 'BERAT', '0' )"

        elif (float(berat) > 0 and unit == "kilogram") :
            total_jual = harga_jual * float(berat) * 1000
            total_beli = harga_beli * float(berat) * 1000
            query_insert = "INSERT INTO list_tanya VALUES (NOW(), 'HARGA_EMAS', 'TABUNGAN_EMAS', 'BERAT', '" + str(float(berat) * 1000) + "' )"

        else :
            unit = "gram"
            total_jual = harga_jual * float(berat)
            total_beli = harga_beli * float(berat)
            query_insert = "INSERT INTO list_tanya VALUES (NOW(), 'HARGA_EMAS', 'TABUNGAN_EMAS', 'BERAT', '" + str(berat) + "' )"
        
        message = f"""
        Harga emas hari ini untuk {berat} {unit}:\n
        JUAL: Rp {total_jual:,} (@Rp {harga_jual:,}/gram) \n
        BELI: Rp {total_beli:,} (@Rp {harga_beli:,}/gram)
        """
        dispatcher.utter_message(message)
        insert(query_insert)
        return[]