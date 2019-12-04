#!/usr/bin/env python2.7
from datetime import datetime
import RPi.GPIO as GPIO
import subprocess

BUTTON_PIN = 23     # pin number in BCM standard
mountpoint = "/mnt/flash"
copydir = "/mnt/matrix/flash/"
copy_script = "/home/pi/button/copy_files.sh"

GPIO.setmode(GPIO.BCM)
GPIO.setup(BUTTON_PIN, GPIO.IN, pull_up_down = GPIO.PUD_UP)     # set BUTTON_PIN as input and configure pull up on it

def do_flash(date, mountpoint, copydir):
    bashCommand = "{} {} {} {}".format(copy_script, mountpoint, copydir, date)
    process = subprocess.check_call(bashCommand.split())

def button_pressed(channel):
    date = datetime.now().strftime('%Y-%m-%d-%H-%M-%S')
    print("{}   button on pin {} pressed!".format(date, BUTTON_PIN))
    do_flash(date, mountpoint, copydir)

GPIO.add_event_detect(BUTTON_PIN, GPIO.FALLING, callback = button_pressed, bouncetime = 300)

try:
    while True:
        pass
except KeyboardInterrupt:
    GPIO.cleanup()
