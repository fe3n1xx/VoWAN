import sys
import os
import subprocess

filename = "type.txt"
if os.path.exists(filename) == False:
    print("type.txt doesn't exist\n")
    print("VoWAN ERROR: /general/type.txt MISSING OR NOT FOUND")
with open(filename) as f:
    typetext = f.read()


if "pooler" in typetext:
    subprocess.run(["../pooler/main.py"])
    print("RAN \n ../pooler/main.py")
elif "bank" in typetext:
    subprocess.run("../bank/main.py")
    print("RAN \n ../bank/main.py")

print("end ../general/startapp.py")