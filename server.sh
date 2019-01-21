#!/bin/bash
echo $$
echo "starting glusterd"
glusterd --no-daemon
echo terminated
exit 0
