
import RPi.GPIO as GPIO
from time import sleep
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import paho.mqtt.client as mqtt

cred = credentials.Certificate("/home/vk/Desktop/Confringo/flicker-60df8-firebase-adminsdk-v3i2p-82726bb431.json")
firebase_admin.initialize_app(cred)
db = firestore.client()
collection = db.collection('Users')

def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))

    client.subscribe("PIRMotionSensor")

def on_message(client, userdata, msg):
    print(msg.topic+" "+str(msg.payload))
    x=msg.payload
    res = collection.document('xThiVuYMQ4yM1AoxHAXi').get().to_dict()
    if(x==b'1'):
            print("entry")
            GPIO.output(4, 0)
            if(not(res['NodeAdress']['Auto'])):
                 client.loop_stop(force=True)
    else:
            print("Exit")
            GPIO.output(4, 1)

client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message


GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.setup(4, GPIO.OUT)
while (True):    
    res = collection.document('xThiVuYMQ4yM1AoxHAXi').get().to_dict()
    print("I am here")

    if(not(res['NodeAdress']['Auto'])):
        print(res['NodeAdress']['CurrentStatus'])
        if(res['NodeAdress']['CurrentStatus']):
            GPIO.output(4, 0)
        else:
            GPIO.output(4, 1)
    else:
        client.connect("192.168.0.117", 1883, 60)
        client.loop_start()
        sleep(5.0)
        client.loop_stop(force=True)


        

    
