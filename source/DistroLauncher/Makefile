icon.ico: icon.svg
	inkscape -f '$<' -C -w 16 -e icon_16x16.png
	inkscape -f '$<' -C -w 32 -e icon_32x32.png
	inkscape -f '$<' -C -w 48 -e icon_48x48.png
	inkscape -f '$<' -C -w 256 -e icon_256x256.png
	icotool -c -o $@ icon_*.png
	rm icon_*.png

