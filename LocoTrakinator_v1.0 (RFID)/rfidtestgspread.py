import sys

from time import sleep
import sys
import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522

reader = SimpleMFRC522()
import gspread
from oauth2client.service_account import ServiceAccountCredentials
scope = ['https://spreadsheets.google.com/feeds',
         'https://www.googleapis.com/auth/drive']
creds = ServiceAccountCredentials.from_json_keyfile_name('LocoTrackinator.json', scope)
client = gspread.authorize(creds)
sheet = client.open("LocoTrackinator").sheet1
sheet2 = client.open("LocoTrackinator").worksheet("Sheet2")
sheet3 = client.open("LocoTrackinator").worksheet("Sheet3")
sheet4 = client.open("LocoTrackinator").worksheet("Sheet4")


try:
    while True:
        print("Hold a tag near the reader")
        id, text = reader.read()
        text=text.strip()
        a=sheet2.find(text)
        b=sheet4.find(text)
        sheet2.update_cell(a.row,2,'Expo')
        sheet4.update_cell(b.row,2,'Expo')
        print("ID: %s\nText: %s" % (id,text))
        sleep(1)
except KeyboardInterrupt:
    GPIO.cleanup()
    raise
