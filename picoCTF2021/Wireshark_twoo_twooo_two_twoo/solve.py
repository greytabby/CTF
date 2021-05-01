from scapy.all import *
import base64

# get packets from pcapng file by filtering dns query packet.
# packets=rdpcap('./shark2.pcapng').filter(lambda p: IP in p and p[IP].src == '192.168.38.104' and p[IP].dst == '8.8.8.8')
packets=rdpcap('./shark2.pcapng').filter(lambda p: IP in p and DNS in p and p[IP].src == '192.168.38.104' and p[IP].dst == '18.217.1.57')

msg = ''

for i in range(0, len(packets), 3):
    msg += packets[i][DNS].fields['qd'].fields['qname'].decode().split('.')[0]

print(base64.b64decode(msg.encode()))
