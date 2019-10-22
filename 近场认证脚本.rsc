# oct/19/2019 22:35:29 by RouterOS 6.45.6
# software id = 1QJH-NEZU
#
# model = RouterBOARD wsAP 5Hac2nD
# serial number = 7D4508FD547B
/interface wireless access-list
add comment="\BD\FC\B3\A1\C8\CF\D6\A4\D4\CA\D0\ED" signal-range=-30..120 \
    vlan-mode=no-tag
add authentication=no comment="\BD\FC\B3\A1\C8\CF\D6\A4\D7\E8\D6\B9" \
    forwarding=no signal-range=-120..-31 vlan-mode=no-tag

/ip dhcp-server
add add-arp=yes address-pool=dhcp_pool1 disabled=no interface=bridge1 \
    lease-script=":foreach abcd in=[/ip dhcp-server lease find waiting] do={\r\
    \n/interface wireless access-list remove [find mac-address=[/ip dhcp-serve\
    r lease get value-name=mac-address number=\$abcd]]\r\
    \n/ip dhcp-server lease remove numbers=\$abcd}\r\
    \n\r\
    \n\r\
    \n:foreach nowcc in=[/ip dhcp-server lease find dynamic=yes] do={\r\
    \n/interface wireless access-list add mac-address=[/ip dhcp-server lease g\
    et value-name=mac-address number=\$nowcc] comment=(\"\\BD\\FC\\B3\\A1\\C8\
    \\CF\\D6\\A4\".\"\".[/system clock get date].\" \".[/system clock get time\
    ])\r\
    \n/interface wireless access-list move [find mac-address=[/ip dhcp-server \
    lease get value-name=mac-address number=\$nowcc]] destination=0\r\
    \n/ip dhcp-server lease make-static number=\$nowcc}\r\
    \n/system leds set leds=user-led type=on [find leds=user-led]\r\
    \n:delay 2s\r\
    \n:beep  length=2s\r\
    \n/system leds set leds=user-led type=off [find leds=user-led]\r\
    \n\r\
    \n" lease-time=10h10m name=dhcp1


/system leds add leds=user-led type=off
