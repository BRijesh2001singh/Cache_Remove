#!/bin/bash

# Define directories
TEMP="C:/Windows/Temp"
MOD_TEMP="$HOME/AppData/Local/Temp"
PRE_FETCH="C:/Windows/Prefetch"

#function to clear cache
remove_cache(){ 

local dir="$1"
   if [ -d "$dir" ]; then
      #remove files and folder
     find "$dir" -type f -exec rm {} \; > /dev/null 2>&1
       #remove directory
        find "$dir" -mindepth 1 -type d -empty -delete > /dev/null 2>&1

         if [ "$dir" = "$TEMP" ]; then
             echo "TEMP CLEARED"
          elif [ "$dir" = "$MOD_TEMP" ]; then
                echo "MOD TEMP CLEARED"
           elif [ "$dir" = "$PRE_FETCH" ]; then
                echo "PREFETCH CLEARED"
              fi
else 
echo "NOT FOUND"
fi
}

remove_cache "$TEMP"
remove_cache "$MOD_TEMP"
remove_cache "$PRE_FETCH"
