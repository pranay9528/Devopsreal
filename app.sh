#!/bin/bash
echo "App started .."
echo " conntecting to data base at $DB_HOST"
ping -c 2 $DB_HOST
echo "app runing"
while true
do
sleep 10
done

