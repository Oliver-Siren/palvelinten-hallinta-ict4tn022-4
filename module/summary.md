SaltStack SteamCMD
1. Have a Linux environment with useful things like curl installed
2. Set up Salt with a minion and master

But first setting up everything manually (Xubuntu):

1. Create a user, "steam" with useradd. Go to /home/steam

```
useradd -m steam
```

2. Install steamcmd via apt.
3. Create a symlink with the executable ln 

```
ln -s /usr/games/steamcmd steamcmd
```
4. Run steamcmd. 
5. Login, either anonymous or <username>
6. To download games or dedicated servers, first change the install directory, then update the desired/correct app ID.

```
force_install_dir <path>
app_update <app_id> validate
```
7. "Error! App <app_id> state is 0x202 after update job." You've run out of disk space. 
8. To run games, realize you've made a mistake and SteamCMD can't run regular games. I haven't dabbled with dedicated servers, and wouldn't know what to do. Abort!
