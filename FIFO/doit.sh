#!/bin/bash

# Edgar Perez
# This script helps to determine if input_data = output_data
# check if the work director exists

echo "Comparing files... "

#Compare input_data and output_data
if [ -s "input_data" -a -s "output_data" ]; then

  echo "Files exist!"
fi

diff "input_data" "output_data" &> /dev/null;

  #diff input_data output_data >| compare_file
  #diff "input_data" "output_data" | grep ">" | sed 's/^> //g' > diff_file
  #diff "input_data" "output_data"

#if [ ! -s compare_file ]; then
if [ $? -eq 0 ]; then
  echo "FILES are the same yeah!"

else
  echo "FILES are NOT the same :(  ---> (sad face)"
  fi
