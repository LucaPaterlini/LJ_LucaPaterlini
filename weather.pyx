## CONSTANTS
DAYS=14 # range between 1 to 17 extreme included
URL="http://api.openweathermap.org/data/2.5/forecast/daily?q=%s&units=metric&cnt=%d&APPID=%s"
APP_ID="0e83edfb1541cb66a71db49f12ac7e98"

from datetime import datetime
from collections import Counter
import requests

def weather_forecast(city_name):
    try:
        r = requests.get(URL%(city_name,DAYS,APP_ID)).json()
    except requests.exceptions.ConnectionError:
        return {'cod':'404','message':'connection error'}

    if r["cod"]!='200': return r
    response = {}
    response["temp_max"] = max([item["temp"]["max"] for item in r["list"]])
    response["temp_min"] = min([item["temp"]["min"] for item in r["list"]])
    # get the maximum of the occurrency of each description field
    response["prevaling_climate"] = Counter([[weather["description"] for weather in item["weather"]]
         for item in r["list"]][0]).most_common(1)[0][0]

    response["date_rain"]=[]
    for item in r["list"]:
        for weather in item["weather"]:
            if weather["main"] == 'Rain':response["date_rain"].append(item["dt"])
    return response