#!/bin/sh

# Build dnstt-server
git clone https://www.bamsoftware.com/git/dnstt.git
cd dnstt/dnstt-server
make

# ارجع للمجلد الأصلي
cd ../../

# شغّل السيرفر
./dnstt/dnstt-server/dnstt-server -udp :443 khartoshtop.qzz.io server.key
