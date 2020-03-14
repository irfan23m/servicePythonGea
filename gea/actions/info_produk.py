from typing import Dict, Text, Any, List, Union, Optional

from rasa_sdk import Tracker, Action
from rasa_sdk.events import SlotSet
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.forms import FormAction

from connect_mysql import select, insert

import requests

class InfoProduk(Action):
    def name(self):
        return "actions_info_produk"
    
    def run(self, dispatcher, tracker, domain):
        produk = tracker.get_slot("produk")
        query_list = select("SELECT produk FROM produk")
        list_produk = [str(i[0]) for i in query_list]
        if produk.upper() in list_produk:    
            query_select = "SELECT deskripsi FROM produk WHERE produk = '"+ produk.upper() +"'"        
            result = select(query_select)
            dispatcher.utter_message(text=f"{result[0][0]}")
        else:
            produk_ada = ", ".join(list_produk)
            dispatcher.utter_message(text=f"Sekarang pegadaian menyediakan produk: {produk_ada}")
        query_insert = "INSERT INTO list_tanya VALUES (NOW(), 'INFO_PRODUK', '" + str(produk.upper()) + "', '' , '' )"
        insert(query_insert)
        return[]
