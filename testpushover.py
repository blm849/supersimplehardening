#############################################################################
#
# testpushover.py                                    
#
# Description:
#  
#	This program reads a file and sends it out via Pushover
#
# History:
#
#       2015.08.12	Initial implementation. (BLM)
#		2025.11.04	Upgraded it from python2 to python3
#
# Examples:
#
#       To call the program, enter: python testpushover.py fileName sysName
#
#############################################################################

# Initialization of variables, etc.
import http.client, urllib, sys

myTitle = "test"
myMessage = "Hello World!"
myPushoverToken = "<your pushover token>"
myPushoverUserID = "<your pushover ID>"
	

conn = http.client.HTTPSConnection("api.pushover.net:443")
conn.request("POST", "/1/messages.json",
  urllib.parse.urlencode({
    "token": myPushoverToken,
    "user": myPushoverUserID,
    "message": myMessage,
  }), { "Content-type": "application/x-www-form-urlencoded" })
conn.getresponse()
sys.exit(0)


