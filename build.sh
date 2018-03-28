#!/bin/bash
# Configure for use outside of a windowed environment for Amano
./configure --prefix=/usr/local \
            --enable-neon \
            --enable-floathard \
            --disable-oss \
            --disable-x11 \
            --disable-wayland \
            --disable-7zip \
            --disable-libxml2 \
            --disable-shaderpipeline \
            --disable-cheevos && \
sed -i "s/^CFLAGS = .*/CFLAGS = /" config.mk && \
sed -i "s/^ASFLAGS = .*/ASFLAGS = /" config.mk && \
make -j $SHED_NUMJOBS && \
make DESTDIR="$SHED_FAKEROOT" install
