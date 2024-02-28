# IP-Adresse abrufen und in die Datei schreiben
ip addr show | grep 'inet ' | awk '{print "IP-Adresse: " $2}' > Linux_Sysinfos.txt

# MAC-Adresse abrufen und in die Datei schreiben
ip link show | awk '/ether/ {print "MAC-Adresse: " $2}' >> Linux_Sysinfos.txt

# Gateway-Adresse abrufen und in die Datei schreiben
ip route | awk '/default/ {print "Gateway-Adresse: " $3}' >> Linux_Sysinfos.txt

# Arbeitsspeicherinformationen abrufen und in die Datei schreiben
free -h | grep 'Mem' | awk '{print "Arbeitsspeicher: " $2}' >> Linux_Sysinfos.txt

# Festplattenspeicherinformationen abrufen und in die Datei schreiben
df -h | grep '/dev/' | awk '{print "Festplattenspeicher: " $2}' >> Linux_Sysinfos.txt

# Ausgabe der Systeminformationen in eine Datei vereinfacht
# nmcli > Linux_Sysinfos.txt && free >> Linux_Sysinfos.txt && lsblk >> Linux_Sysinfos.txt
