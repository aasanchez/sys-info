#!/usr/bin/env bash

GIT_TAG=$(git tag -l | grep -E "^[0-9]+\.[0-9]+\.[0-9]+$" | sort -V | tail -n 1)
BUILD_DATE=$(date +"%Y%m%d%H%M%S")
ARCH=all

rm -rf pkg/sys-info_*

mkdir -p pkg/sys-info_"$GIT_TAG"-"$BUILD_DATE"_"$ARCH"/usr/bin
cp -r sys-info pkg/sys-info_"$GIT_TAG"-"$BUILD_DATE"_"$ARCH"/usr/bin
sudo chmod 755 pkg/sys-info_"$GIT_TAG"-"$BUILD_DATE"_"$ARCH"/usr/bin/sys-info

# Debian package structure
mkdir -p pkg/sys-info_"$GIT_TAG"-"$BUILD_DATE"_"$ARCH"/DEBIAN
cp pkg/scripts/control  pkg/sys-info_"$GIT_TAG"-"$BUILD_DATE"_"$ARCH"/DEBIAN/control
sed -i "s/<VERSION>/"$GIT_TAG"-"$BUILD_DATE"/g" pkg/sys-info_"$GIT_TAG"-"$BUILD_DATE"_"$ARCH"/DEBIAN/control
sed -i "s/<ARCH>/"$ARCH"/g" pkg/sys-info_"$GIT_TAG"-"$BUILD_DATE"_"$ARCH"/DEBIAN/control

# Pre installation script
cp pkg/scripts/preinst pkg/sys-info_"$GIT_TAG"-"$BUILD_DATE"_"$ARCH"/DEBIAN/preinst
chmod 755 pkg/sys-info_"$GIT_TAG"-"$BUILD_DATE"_"$ARCH"/DEBIAN/preinst

# Post installation script
cp pkg/scripts/postinst pkg/sys-info_"$GIT_TAG"-"$BUILD_DATE"_"$ARCH"/DEBIAN/postinst
chmod 755 pkg/sys-info_"$GIT_TAG"-"$BUILD_DATE"_"$ARCH"/DEBIAN/postinst

# Pre Removal script
cp pkg/scripts/prerm pkg/sys-info_"$GIT_TAG"-"$BUILD_DATE"_"$ARCH"/DEBIAN/prerm
chmod 755 pkg/sys-info_"$GIT_TAG"-"$BUILD_DATE"_"$ARCH"/DEBIAN/prerm

# Post Removal script
cp pkg/scripts/postrm pkg/sys-info_"$GIT_TAG"-"$BUILD_DATE"_"$ARCH"/DEBIAN/postrm
chmod 755 pkg/sys-info_"$GIT_TAG"-"$BUILD_DATE"_"$ARCH"/DEBIAN/postrm

dpkg --build pkg/sys-info_"$GIT_TAG"-"$BUILD_DATE"_"$ARCH"
cp pkg/sys-info_"$GIT_TAG"-"$BUILD_DATE"_"$ARCH".deb sys-info.deb

dpkg-deb --info sys-info.deb
sudo dpkg -i sys-info.deb
