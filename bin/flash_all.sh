#!/bin/bash

n=0
while true
do
    echo "******** flash boot image ********"
    fastboot flash boot boot.img
    if [ $? -ne 0 ]; then
        echo -e "\033[31m!!! failed to flash boot !!!\033[0m"
        exit 2
    fi

    echo "******** flash system image ********"
    fastboot flash system system.img
    if [ $? -ne 0 ]; then
        echo -e "\033[31m!!! failed to flash system !!!\033[0m"
        exit 2
    fi

    if [ -f userdata.img ]; then
        echo "******** flash userdata image ********"
        fastboot flash userdata userdata.img
        if [ $? -ne 0 ]; then
            echo -e "\033[31m!!! failed to flash userdata !!!\033[0m"
            exit 2
        fi
    fi

    if [ -f cache.img ]; then
        echo "******** flash cache image ********"
        fastboot flash cache cache.img
        if [ $? -ne 0 ]; then
            echo -e "\033[31m!!! failed to flash cache !!!\033[0m"
            exit 2
        fi
    fi

    if [ -f recovery.img ]; then
        echo "******** flash recovery image ********"
        fastboot flash recovery recovery.img
        if [ $? -ne 0 ]; then
            echo -e "\033[31m!!! failed to flash recovery !!!\033[0m"
            exit 2
        fi
    fi

    if [ -f persist.img ]; then
        echo "******** flash persist image ********"
        fastboot flash persist persist.img
        if [ $? -ne 0 ]; then
            echo -e "\033[31m!!! failed to flash persist !!!\033[0m"
            exit 2
        fi
    fi

    if [ -f NON-HLOS.bin ]; then
        echo "******** flash modem image ********"
        fastboot flash modem NON-HLOS.bin
        if [ $? -ne 0 ]; then
            echo -e "\033[31m!!! failed to flash modem !!!\033[0m"
            exit 2
        fi
    fi

    if [ -f emmc_appsboot.mbn ]; then
        echo "******** flash bootloader image ********"
        fastboot flash aboot emmc_appsboot.mbn
        if [ $? -ne 0 ]; then
            echo -e "\033[31m!!! failed to flash bootloader !!!\033[0m"
            exit 2
        fi
    fi

    echo "******** reboot device ********"
    fastboot reboot

    let n=n+1
    echo -e "\033[32mOK to flash Android\033[0m"
    echo
    echo -e "\033[32mFlash Total:$n\033[0m"
    echo
    sleep 10
done
