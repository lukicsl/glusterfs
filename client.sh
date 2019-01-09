#!/bin/bash
echo $$
trap 'trap - TERM; umount $LC_DIR; kill -s TERM -- -$$' TERM
while true; do
  mount.glusterfs $LC_SRV:$GVOL $LC_DIR
  if [ $? -eq 0 ]
  then
    break
  fi
  sleep 1
done
tail -f /dev/null & wait

exit 0
