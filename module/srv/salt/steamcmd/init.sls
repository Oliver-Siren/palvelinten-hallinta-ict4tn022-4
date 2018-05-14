# Install SteamCMD
#
# mkdir <directory to install SteamCMD into>
# cd <that same directory>
# wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
# tar xvf steamcmd_linux.tar.gz
#
# Or just use apt, it's easier...
#
# https://developer.valvesoftware.com/wiki/SteamCMD


steam:
  user.present:
    - fullname: steam
    - shell: /bin/bash
    - home: /home/steam
    - uid: 5000
    - gid: 5000
    - groups:
      - 
