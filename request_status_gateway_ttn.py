#!/usr/bin/env python

from pyvirtualdisplay import Display
#sudo apt-get install xvfb
#pip install pyvirtualdisplay
from selenium import webdriver
import time

display = Display(visible=0, size=(800, 600))
display.start()

browser = webdriver.Chrome() #replace with .Firefox(), or with the browser of your choice
url = "https://console.thethingsnetwork.org/gateways/my_gateway_id"
browser.get(url) #navigate to the page
time.sleep( 2 )
username = browser.find_element_by_name("username") #username form field
password = browser.find_element_by_class_name("password") #password form field
#
username.send_keys("my_username")
password.send_keys("my_password")

submitButton = browser.find_element_by_class_name("submit")
submitButton.click()

time.sleep( 5 )
innerHTML = browser.execute_script("return document.body.innerHTML")

browser.close()

if '-->connected<!--' in innerHTML:
    print 'success connected'
else:
    print 'NOT connected'

if 'seconds ago<' in innerHTML:
    print 'success seconds ago'
else:
    print 'NOT seconds ago'
