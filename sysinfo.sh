# IP-Adresse abrufen und in die Datei schreiben
ip addr show | grep 'inet ' | awk '{print "IP-Adresse: " $2}' > Linux_Sysinfos.txt

# Gateway-Adresse abrufen und in die Datei schreiben
ip route | grep default | awk '{print "Gateway: " $3}' >> Linux_Sysinfos.txt

# MAC-Adresse abrufen und in die Datei schreiben
ip link show | awk '/ether/ {print "MAC: " $2}' >> Linux_Sysinfos.txt

# Arbeitsspeicherinformationen abrufen und in die Datei schreiben
awk 'NR==1' /proc/meminfo >> Linux_Sysinfos.txt

# Festplattenspeicherinformationen abrufen und in die Datei schreiben
df -h | grep '/dev/' | awk '{print "Festplattenspeicher: " $2}' >> Linux_Sysinfos.txt

# Ausgabe der Systeminformationen in eine Datei vereinfacht
# nmcli > Linux_Sysinfos.txt && free >> Linux_Sysinfos.txt && lsblk >> Linux_Sysinfos.txt
