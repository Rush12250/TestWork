import subprocess
import time

ans=True
while ans:
    print ("""
    1.UP javafile
    2.Down javafile
    3.STATUS
    """)
    ans= input("What would you like to do? ")
    if ans=="1":
        subprocess.Popen("docker-compose up -d", shell=True)
        time.sleep(5.5)    # pause 5.5 seconds
        subprocess.call("docker ps -a", shell=True)
    elif ans=="2":
        subprocess.Popen("docker-compose down", shell=True)
        time.sleep(5.5)    # pause 5.5 seconds
        subprocess.call("docker ps -a", shell=True)
    elif ans=="3":
        subprocess.call("docker ps -a", shell=True)
