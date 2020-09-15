#!/bin/bash

# [purpose]
#   To rename files as "the number" shift from the start_num

#==========================
format="jpg"
#==========================


#=================================
function _show_result_() {
  num=${start_num}
  for file in ${files}
  do
    displaynum=$(printf %02d ${num})
    filename="${prefix_name}_${displaynum}.${format}"
    echo "RENAME: ${file} -> ${filename}"
    num=$(( num + 1 ))
  done
}

function _confirmation_() {
  echo -n "Are you sure?[y/n]: "
  local res
  read res
  if [ "$res" != "y" ]; then echo -e "stopped\n"; exit; fi
}
#=================================

# Numeric Check
echo -n "Enter the \"start number\": "
read start_num
if [[ "$start_num" =~^[0-9]+$ ]]; then
  :
else
  echo -e "it does NOT number\nstopped\n"; exit
fi


# prefix Name
echo -n "Enter the \"prefix name\": "
read prefix_name

# Store Array
files="$@"

# Show Result
_show_result_


# Confirmation of Rename Execution
_confirmation_


# Rename Execution
num=${start_num}
for file in ${files}
do
  displaynum=$(printf %02d ${num})
  filename="${prefix_name}_${displaynum}.${format}"
  echo "RENAME: ${file} -> ${filename}"
  mv ${file} ${filename}
  num=$(( num + 1 ))
done

exit


