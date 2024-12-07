# trimui_brick_dev
Basic TrimUI Brick Dev bits n bobs


Assuming you have a mac
Install brew from brew.sh if you no haz

https://brew.sh and follow instructions, then

```bash
#Install adb
brew install --cask android-platform-tools
```

Make a System folder on your SD Card, and copy all the files from the repo into there, and then plug the SD Card into the Brick
Then power up the brick,and it into usb so we can connect via usb ADB

```bash
#List connected devices
adb devices
```
You should see a device list like below:

```bash
List of devices attached
9c000c64a5444871add	device
```

Assuming you have something like that, connect to it via adb:

```bash
#Connect to our brick
adb shell
```

Should hopefully see a login shell like below.
We can now install the tools into /etc and have the paths to libraries and tools added via setup.sh (as below)

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
% adb shell

adb shell
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
#You should see a columns;lines added now

#/mnt/SDCARD/System/bin and below has binaries, and the shell should be more usable.

TO DO

Add local cross compiler and libs


