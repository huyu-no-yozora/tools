#!/bin/bash

#======================
PARENTDIR="${PWD}"
#======================


#=================================
function _confirmation_() {
  echo -n "Are you sure?[y/n]: "
  local res
  read res
  if [ "$res" != "y" ]; then echo -e "stopped\n"; exit; fi
}


function _show_result_() {
  files=$(find "${PARENTDIR}" -type f | sed 's!^.*/!!')
  echo ${files}
  for file in ${files}
  do
    file_num=$(printf "%02d\n" $(basename ${file} | sed -e 's/[^0-9]//g' ))
    file_format="${file##*.}"
    filename="${file_num}.${file_format}"
    echo "RENAME: ${file} -> ${filename}"
  done
}
#=================================

# Display Parent Directory
echo -e "Parent Directory: ${PARENTDIR}\n"

# Show Result
_show_result_


# Confirmation of Rename Execution
_confirmation_

# Rename Execution
files=$(find "${PARENTDIR}" -type f | sed 's!^.*/!!')
echo ${files}
for file in ${files}
do
  file_num=$(printf "%02d\n" $(basename ${file} | sed -e 's/[^0-9]//g' ))
  file_format="${file##*.}"
  filename="${file_num}.${file_format}"
  mv ${file} ${filename}
  echo "RENAME: ${file} -> ${filename}"
done

exit
