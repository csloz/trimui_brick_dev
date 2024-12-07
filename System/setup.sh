echo "Starting setup"
echo "This will:"
echo "Update busybox, add ssl certs, add symlinks for new busybox internals"
echo "Add libSDL libs to /lib, update /etc/adb_profile to include paths and nicer defaults"


#Add busybox **INVASIVE**
if [ ! -f /bin/busybox.orig ]; then
   echo "No Busybox backup found, overwriting existing shell"
   mv /bin/busybox /bin/busybox.orig
   cp -vf /mnt/SDCARD/System/bin/busybox /bin

   #add symlink for busybox
   if [ ! -f /bin/bash ]; then
     echo "Adding Busybox symlink"
     ln -vs "/bin/busybox" "/bin/bash"
  fi

  #add symlink for ldd so busybox doesn't snarf
  
fi


# Create symlinks for new  busybox commands mia
for cmd in $(busybox --list); do
    # NB Exclude sh map
    if [ -e "/bin/$cmd" ] || [ -e "/usr/bin/$cmd" ] || [ "$cmd" = "sh" ]; then
        continue
    fi

    # Create a symbolic link
    echo "Mapping $cmd"
    ln -vs "/bin/busybox" "/bin/$cmd" 
done

#update sdl lib paths  **INVASIVE**
for from in /usr/trimui/lib/libSDL*; do
    to="/usr/lib/$(basename "$to")"
    if [ ! -e "$to" ]; then
       echo "mapping libSDL libs to /usr/lib"
       ln -vs "$from" "$to"
    fi
done

#add ssl cert  **INVASIVE**
if [ ! -e /etc/ssl/certs ]; then
   echo "Making SSL Cert folder and copying cert files"
   mkdir -p /etc/ssl/certs
   cp -vf /mnt/SDCARD/System/etc/ssl/certs/*.crt /etc/ssl/certs 
fi

#update /etc/adb_profile to add SDCARD path and other bits  **INVASIVE**
if [ ! -f /etc/adb_profile.orig ]; then
  echo "Updating adb_profile"
  mv /etc/adb_profile /etc/adb_profile.orig
  cp -vf /mnt/SDCARD/System/etc/adb_profile /etc/adb_profile
fi

#Add dropbear folder
if [ ! -e /etc/dropbear ]; then
   mkdir -p /etc/dropbear
   echo "Added dropbear folder.  Note root password is tina"
fi




echo "Done"
