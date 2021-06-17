#!/bin/bash -f
source /tools/Xilinx/Vitis/2020.1/settings64.sh
cd Emulation-HW/
make -j8 clean
make -j8 incremental
retval=$?
cd ..
if [ "$retval" == 0 ]
then
     exit 0
else
     exit 1
fi
