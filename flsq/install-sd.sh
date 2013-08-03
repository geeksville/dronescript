
DEST=/media/CC5F-F837

echo "Writing to micro SD at $DEST"
mkdir -p $DEST/flsq
cp -a gen lib startup.nut $DEST/flsq
umount $DEST
echo "flsq files written SD card ejected"

