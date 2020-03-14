from typing import Dict, Text, Any, List, Union, Optional

from rasa_sdk import Tracker, Action
from rasa_sdk.events import SlotSet
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.forms import FormAction

from connect_mysql import select, insert

import requests

class TidakMengerti(Action):
    def name(self):
        return "actions_tidak_mengerti"
    
    def run(self, dispatcher, tracker, domain):
        text = tracker.latest_message.get('text')
        user_id = tracker.sender_id
        
        dispatcher.utter_message(text="Maaf Gea tidak mengerti maksud kaka.")

        query_insert = f"INSERT INTO list_error (tanggal, text, user) values (NOW(), '{str(text)}', '{str(user_id)}')"
        insert(query_insert)
        return[]
