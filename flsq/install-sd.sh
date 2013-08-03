
DEST=/media/982B-A9B8

./compileall
echo "Writing to micro SD at $DEST"
mkdir -p $DEST/flsq
cp -a gen/*.nut $DEST/flsq/gen
cp -a lib/*.nut $DEST/flsq
cp -a startup.nut $DEST/flsq
umount $DEST
echo "flsq files written SD card ejected"

