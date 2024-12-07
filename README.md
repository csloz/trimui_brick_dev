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


## Root Password
```bash
#on device
cat /etc/shadow
root:91rMiZzGliXHM:1:0:99999:7:::
```

on mac
```bash
brew install john
cat  root:91rMiZzGliXHM:1:0:99999:7::: > passwd

john passwd 
Loaded 1 password hash (descrypt, traditional crypt(3) [DES 64/64])
Press 'q' or Ctrl-C to abort, almost any other key for status
tina             (root)
1g 0:00:00:00 100% 2/3 100.0g/s 262200p/s 262200c/s 262200C/s raquel..vanilla
Use the "--show" option to display all of the cracked passwords reliably
Session completed

root password is tina 
```

If you want to ssh in, add dropbear to the startup, and find out the device ip

```bash
#find out local ip on device.  yours will be different, mine below is at 192.168.1.108
ifconfig
lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:48 errors:0 dropped:0 overruns:0 frame:0
          TX packets:48 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1 
          RX bytes:3744 (3.6 KiB)  TX bytes:3744 (3.6 KiB)

wlan0     Link encap:Ethernet  HWaddr DC:44:60:37:5E:51  
          inet addr:192.168.1.108  Bcast:192.168.1.255  Mask:255.255.255.0
          inet6 addr: fe80::de44:60ff:fe37:5e51/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:90990 errors:0 dropped:0 overruns:0 frame:0
          TX packets:165 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:38666855 (36.8 MiB)  TX bytes:17816 (17.3 KiB)
#start dropbear in background.  Note need to do after running setup.sh as this needs /etc/dropbear to be created

dropbear -R 
```

Can now ssh to the device vs adb shell from the output you got from ifconfig on the brick

```bash
#from your computer

#root pass is tina
ssh 192.168.1.108 -l root
```


  
TO DO

Add local cross compiler and libs

Add config for dropbear ssh and sftp etc



## Bonus image of board from retro_handhelds #brick
![](trimui_board.png?raw=true)
