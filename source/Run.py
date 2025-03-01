import os 
import threading

def start_lua():
    os.system("sudo lua5.2 Fast.lua")
thread_ = threading.Thread(target=start_lua)
thread_.start()

def start_porn():
    os.system("python3.8 sex.py")

th = threading.Thread(target=start_porn)
th.start()