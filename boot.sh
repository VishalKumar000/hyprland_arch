#!/bin/bash

location=/config/usb_gadget/g1/functions/mass_storage.0

reads(){
    if [ -z "$1" ] 
    then
    echo "Please input the iso file.."
    else
    echo "1" > /config/usb_gadget/g1/functions/mass_storage.0/lun.0/ro
    echo "0" > /config/usb_gadget/g1/functions/mass_storage.0/lun.0/cdrom
    echo $1 > /config/usb_gadget/g1/functions/mass_storage.0/lun.0/file
    cat  /config/usb_gadget/g1/functions/mass_storage.0/lun.0/file
    setprop sys.usb.config mass_storage
    fi
}

write(){
    if [ -z "$1" ] 
    then
    echo "Please input the iso file.."
    else
    echo "0" > /config/usb_gadget/g1/functions/mass_storage.0/lun.0/ro
    echo "0" > /config/usb_gadget/g1/functions/mass_storage.0/lun.0/cdrom
    echo $1 > /config/usb_gadget/g1/functions/mass_storage.0/lun.0/file
    cat  /config/usb_gadget/g1/functions/mass_storage.0/lun.0/file
    setprop sys.usb.config mass_storage
    fi
}

floppy(){
    if [ -z "$1" ] 
    then
    echo "Please input the iso file.."
    else
    echo "1" > /config/usb_gadget/g1/functions/mass_storage.0/lun.0/ro
    echo "1" > /config/usb_gadget/g1/functions/mass_storage.0/lun.0/cdrom
    echo $1 > /config/usb_gadget/g1/functions/mass_storage.0/lun.0/file
    cat  /config/usb_gadget/g1/functions/mass_storage.0/lun.0/file
    setprop sys.usb.config mass_storage
    fi
}

off(){
    setprop sys.usb.config mtp
    echo "0" > /config/usb_gadget/g1/functions/mass_storage.0/lun.0/ro
    echo "0" > /config/usb_gadget/g1/functions/mass_storage.0/lun.0/cdrom
    echo "" > /config/usb_gadget/g1/functions/mass_storage.0/lun.0/file
    cat  /config/usb_gadget/g1/functions/mass_storage.0/lun.0/file
    setprop sys.usb.config mtp
}

execute(){
    file=$2
    case $1 in

    read|0)
    reads $file
    ;;
    write|1)
    write $file 
    ;;
    floppy|2)
    floppy $file 
    ;;
    off)
    off 
    ;;
    --help|-h) 
    echo "boot read(0)|write(1)|floppy(2)   file.iso"
    echo "example:  boot write /sdcard/ubuntu.iso"
    echo "example:  boot  0 /sdcard/ubuntu.iso"
    ;;
    esac
}
execute $1 $2