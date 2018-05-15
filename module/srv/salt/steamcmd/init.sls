# Install SteamCMD
#
# mkdir <directory to install SteamCMD into>
# cd <that same directory>
# wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
# tar xvf steamcmd_linux.tar.gz
#
# https://developer.valvesoftware.com/wiki/SteamCMD

steamgroup:
  group.present:
    - name: steam
    - gid: 5000
    - system: True

steam:
  user.present:
    - fullname: steam
    - shell: /bin/bash
    - home: /home/steam
    - uid: 5000
    - gid: 5000
    - groups:
      - steam

steamcmd:
  pkg.installed
# results in prompt asking agreement to terms. Possibly doable with cmd.script and stdin? Or just use tar.

/home/steam/steamcmd:
  file.symlink:
    - target: /usr/games/steamcmd
    - require:
      - pkg: steamcmd

