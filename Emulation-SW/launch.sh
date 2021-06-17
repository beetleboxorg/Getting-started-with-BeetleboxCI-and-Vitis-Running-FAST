
#!/bin/bash -f
source /tools/Xilinx/Vitis/2020.1/settings64.sh
cd Emulation-SW/package/
killall -9 qemu-system-aarch64
killall pllauncher
EMUDIR="$PWD/package"
    if [ -d "$EMUDIR" ]
      then
      OUTDIR=$EMUDIR
      cd $OUTDIR
      echo "Current working dir $OUTDIR"
      if [ -e "qemu_args.txt" ]
        then
        echo "Required emulation files like qemu_args exists"
      else
        echo "Required emulation files like qemu_args.txt doesn't exist. Please run from output dir"
        exit 1
      fi
    else
        if [ -e "qemu_args.txt" ]
          then
          echo "Required emulation files like qemu_args exists"
          cd .
          echo "Current working dir $PWD"
        else
          echo "Required emulation files like qemu_args.txt doesn't exist. Please run from output dir"
          exit 2
        fi
    fi

