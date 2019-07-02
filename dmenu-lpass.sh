#!/bin/bash

selection=`echo -e $(lpass ls | awk -F '[/[]' '{print $(NF-1)"\\\n"}') | dmenu -p "Select account: "`

if [ "$selection" != "" ]; then
    name=`echo -e $(lpass show --name $selection)`
    notify-send -i edit-paste "$name" `echo -e $(lpass show --username $selection)` &
    lpass show -c --password $selection &
fi
