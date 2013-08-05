

# Personal notes
https://pixhawk.ethz.ch/px4/dev/gdb_cheatsheet

cd
./configure --enable-ft2232_libftdi
make
sudo make install
sudo modprobe ftdi_sio

# if you fix the ownership the ftdi serial port, you can do without sudo
cd Firmware
sudo openocd -f interface/olimex-arm-usb-ocd-h.cfg -f Debug/stm32f4x.cfg 

arm-none-eabi-gdb /home/kevinh/development/drone/px4/Firmware/makefiles/build/firmware.elf
tar ext :3333
continue
mon cortex_m3 maskisr on
