#!/bin/bash

# Edgar Perez
# This script helps to determine if input_data = output_data
# is the same, it should be the same
# check if the work director exists

echo "Comparing files... "

#Compare input_data and output_data
if [ -s "input_data" -a -s "output_data" ]; then

  echo "Files exist!"
fi

#compare content dispaly something if different and ignore spaces
diff --brief -w "input_data" "output_data" >/dev/null
comp_value=$?

if [ $comp_value -eq 0 ]; then 
    echo "FILES are the same yeah!"
else
    echo "FILES are NOT the same :(  ---> (sad face)"
fi
