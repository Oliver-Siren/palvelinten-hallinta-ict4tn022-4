# Install TF2 after signing into SteamCMD
# Running SteamCMD opens a Steam> terminal, does Salt work? (Queue keyboard inputs with a script?)
#
# https://developer.valvesoftware.com/wiki/SteamCMD

foo:
  require:
    - sls: init
    
# Running SteamCMD (at least manually)
# 
# steamcmd
# Steam> login <username> (or anonymous)
# Steam> force_install_dir <path>
# Steam> app_update <app_id> validate
# 
# Error 0x202 when out of disk space!
# No commands to launch games...
# Dedicated servers are run with scripts
