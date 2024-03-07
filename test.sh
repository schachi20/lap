
    <<comment
    # Geben sie root das gleiche Password wie dem Windows Server
    # Login als root-User
    root@<MySystem>:  passwd
    Geben Sie ein neues Passwort ein: <DeinWindowsServerPassword>
    Geben Sie ein neues Passwort erneut ein: <DeinWindowsServerPassword>

    # Netzwerkschnittstelle auf DHCP
    nano /etc/network/Interfaces

    # The primary network interface
    allow-hotplug
    eth0 iface eth0 inet dhcp

    Speichern Strg+O und Schliessen Strg+X

    # Netzwerkschnittstelle auf Statisch
    nano /etc/network/Interfaces

    # The primary network interface
    allow-hotplug
    eth0 iface eth0 inet static
         address <Eure IP Address>
         netmask <Eure Netzmaske>
         gateway <Euer Gateway>

    Speichern Strg+O und Schliessen Strg+X

    # Ändern des Hostnames
    hostnamectl set-hostname biohost
    # Überprüfen 1
    hostnamectl
      Static hostname: biohost

    # Überprüfen 2
    nano /etc/hosts
          127.0.0.1            localhost
          127.0.0.1            biohost.biohome.local           biohost
    hostname -> biohost

    Benutzer "Anton.Steiner" anlegen
    sudo useradd -m Anton.Steiner

    Passwort setzen für Anton.Steiner
    sudo passwd Anton.Steiner
    Geben Sie ein neues Passwort ein: Youwillmakeit!
    Geben Sie ein neues Passwort erneut ein: Youwillmakeit!

     Benutzer sperren
    usermod -L "Anton.Steiner"

    Benutzer entsperren
    usermod -U "Anton.Steiner"

    Ausgabe der Systeminformationen in eine Datei
comment
    # IP-Adresse abrufen und in die Datei schreiben
    ip addr show | grep 'inet ' | awk '{print $2}' > Linux_Sysinfos.txt

    # MAC-Adresse abrufen und in die Datei schreiben
    ip link show | awk '/ether/ {print $2}' >> Linux_Sysinfos.txt

    # Gateway-Adresse abrufen und in die Datei schreiben
    ip route | awk '/default/ {print $3}' >> Linux_Sysinfos.txt

    # Arbeitsspeicherinformationen abrufen und in die Datei schreiben
    free -h | grep 'Mem' | awk '{print "Arbeitsspeicher: " $2}' >> Linux_Sysinfos.txt

    # Festplattenspeicherinformationen abrufen und in die Datei schreiben
    df -h | grep '/dev/' | awk '{print "Festplattenspeicher: " $2}' >> Linux_Sysinfos.txt

    #Ausgabe der Systeminformationen in eine Datei vereinfacht
    #nmcli > Linux_Sysinfos.txt && free >> Linux_Sysinfos.txt && lsblk >> Linux_Sysinfos.txt
