#!/bin/bash


if [ "$1" == "" ]
then
echo "SYNTAX ERROR"
echo "SYNTAX: ./purge.sh <word>"
exit
fi

read -p "UPDATEDB? [y/n]:" update

if [ ${update} == y ]
then
echo ===================================================
echo UPDATING DATABASE..................................
echo ---------------------------------------------------
updatedb
fi

echo ==================================================
echo "LOCATING FILES WITH:"$1
locate $1
list=$(locate $1)
echo --------------------------------------------------
read -p "DELETE FILES? [y/n]:" delete

if [ ${delete} == y ]
then
echo DELETING..........................................

for i in $(echo ${list}); do
echo DELETING: $i
rm $i ;
echo ----- 
done
 
echo ==================================================
echo DONE, REUPDATING DATABASE.........................
updatedb
echo --------------------------------------------------

echo ==================================================
echo CHECKING FOR LEFTOVER FILES.......................
locate $1
echo --------------------------------------------------
fi
echo =================================================
read -p "DELETE DIRECTORIES? [y/n]:" deldir
if [ ${deldir} == y ]
then
list=$(locate $1)

echo DELETING.........................................
for i in $(echo ${list}); do
echo DELETING: $i
rmdir $i ;
echo ----- 
done
echo ==================================================
echo DONE, REUPDATING DATABASE.........................
updatedb
echo --------------------------------------------------

echo ==================================================
echo CHECKING FOR LEFTOVER FILES.......................
locate $1
echo --------------------------------------------------
fi

