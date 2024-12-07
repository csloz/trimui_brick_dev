# trimui_brick_dev
Basic TrimUI Brick Dev bits n bobs

Uses stuff from:

https://github.com/weimingtom/trimui_brick_playground
https://github.com/kloptops/TRIMUI_EX/


Assuming you have a mac
Install brew from brew.sh if you no haz

https://brew.sh and follow instructions, then install adb if you don't already have it.

```bash
#Install adb.  Run this on your computer
brew install --cask android-platform-tools
```

Download the repo contents to your computer in your Documents folder.
```bash
#Grab the repo
cd ~/Documents
git clone https://github.com/csloz/trimui_brick_dev.git 
```


Make a System folder on your SD Card, and copy all the files from the repo System folder into there, and then plug the SD Card into the Brick
Then power up the brick,and it into usb so we can connect via usb ADB

```bash
#List connected devices.  Run this on your computer
adb devices
```
You should see a device list like below:

```bash
List of devices attached
9c000c64a5444871add	device
```

Assuming you have something like that, connect to it via adb:

```bash
#Connect to our brick. Run this on your computer
adb shell
```

Should hopefully see a login shell like below.
We can now install the tools into /etc and have the paths to libraries and tools added via setup.sh (as below).
Type in the commands below from the shell on the brick

```bash
 _____  _              __     _
|_   _||_| ___  _ _   |  |   |_| ___  _ _  _ _
  | |   _ |   ||   |  |  |__ | ||   || | ||_'_|
  | |  | || | || _ |  |_____||_||_|_||___||_,_|
  |_|  |_||_|_||_|_|  Tina is Based on OpenWrt!
 ----------------------------------------------
 Tina Linux (Neptune, 5C1C9C53)
 ----------------------------------------------

root@TinaLinux:/#  cd /mnt/SDCARD/System

root@TinaLinux:/mnt/SDCARD/System# ./setup.sh 


Starting setup
This will:
Update busybox, add ssl certs, add symlinks for new busybox internals
Add libSDL libs to /lib, update /etc/adb_profile to include paths and nicer defaults
Done



root@TinaLinux:/mnt/SDCARD/System# reboot
```

Wait 10-15 sec for the device to reboot


```bash
#Run this on your computer
adb shell

```

You should now see an updated login similar to below

```bash
 _____  _              __     _
|_   _||_| ___  _ _   |  |   |_| ___  _ _  _ _
  | |   _ |   ||   |  |  |__ | ||   || | ||_'_|
  | |  | || | || _ |  |_____||_||_|_||___||_,_|
  |_|  |_||_|_||_|_|  Tina is Based on OpenWrt!
 ----------------------------------------------
 Tina Linux (Neptune, 5C1C9C53)
 ----------------------------------------------
COLUMNS=225;LINES=70;export COLUMNS LINES;

```


/mnt/SDCARD/System/bin and below has binaries, and the shell should be more usable as it has more tools.
wget has ssl capability now, etc


Note if you run any of the /mnt/System/bin/sdl_stuff, don't forget to kill MainUI first
eg

```bash
#Run this on your brick in the adb shell
killall -KILL runtrimui.sh MainUI
```



  
TO DO

Add local cross compiler and libs

Add config for dropbear ssh and sftp etc



Bonus image of board from retro_handhelds #brick
![](trimui_board.png?raw=true)
