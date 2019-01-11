#!/bin/bash
echo $$
trap 'trap - TERM; umount $LC_DIR; kill -s TERM -- -$$' TERM

if [ -f /etc/hostname-host ]; then
  LC_SRV=`cat /etc/hostname-host`
fi

if [ ! -d $LC_DIR ]; then
  mkdir $LC_DIR
fi

echo $LC_SRV:$GVOL $LC_DIR

while true; do
  mount.glusterfs $LC_SRV:$GVOL $LC_DIR
  if [ $? -eq 0 ]
  then
    break
  fi
  echo sleep 1s
  sleep 1
done
tail -f /dev/null & wait

exit 0
