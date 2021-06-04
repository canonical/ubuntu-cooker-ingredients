DESTDIR ?= ./build
all: #store-submission/logo.png
	$(MAKE) -C ./source/DistroLauncher-Appx/
	$(MAKE) -C ./source/DistroLauncher/

install:
	mkdir -p ${DESTDIR}/DistroLauncher/images
	mkdir -p ${DESTDIR}/DistroLauncher-Appx/Assets
	cp -rf source/DistroLauncher-Appx/*.png ${DESTDIR}/DistroLauncher-Appx/Assets
	cp -rf source/DistroLauncher/*.ico ${DESTDIR}/DistroLauncher/images

clean_local:
	rm -rf build
	rm -rf source/DistroLauncher-Appx/*.png
	rm -rf source/DistroLauncher/*.ico

clean_remote:
	rm -rf ${DESTDIR}/DistroLauncher-Appx/Assets/*
	rm -rf ${DESTDIR}/DistroLauncher/images/*

# store-submission/logo.png: DistroLauncher-Appx/Assets/cof_unplated.svg
# 	inkscape -f '$<' -D -w 300 -e $@
