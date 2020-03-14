# gea

## Aktivasi virtual environment
dari cmd di direktori awal: <br />
$ ./env/Scripts/activate.bat

## Training data
masuk direktori /gea: <br />
$ rasa train <br />
outputnya nanti ada "..models/{model}" itu modelnya, jangan lupa di copy namanya {model} buat di run

## Siapin MySql database
Bikin database sama tabel-tabelnya (harga emas diinput untuk hari ini) <br />
jangan lupa di atur config nya di /gea/connect_mysql.py sama di /env/Lib/site-packages/rasa_sdk/connect_mysql.py

## Jalanin chatbotnya
di direktori /gea jalanin dua command: <br />
$ Start rasa run actions <br />
$ rasa shell -m models/{model} --endpoints endpoints.yml

## Port untuk post api message
lihat di /gea/endpoints.yml atau:<br />
$ rasa run -m models/{model} --endpoints endpoints.yml <br />
http://localhost:5005/webhooks/rest/webhook
format body (json)
{ 
  "sender": "User", 
  "message": "heyyy" 
}
