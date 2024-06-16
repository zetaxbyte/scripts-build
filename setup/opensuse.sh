#!/usr/bin/env bash

# Script to setup an android build environment for openSUSE.

# openSUSE Mirrors (https://github.com/Firstyear/mirrorsorcerer)
zypper in mirrorsorcerer
systemctl enable --now mirrorsorcerer

# Packages
zypper install \
    android-tools \
    autoconf213 \
    bc \
    bison \
    bzip2 \
    ccache \
    clang \
    curl \
    flex \
    gawk \
    gpg2 \
    gperf \
    gcc-c++ \
    git \
    git-lfs \
    glibc-devel \
    ImageMagick \
    java-11-openjdk \
    java-1_8_0-openjdk \
    java-1_8_0-openjdk-devel \
    liblz4-1 \
    libncurses5 \
    libncurses6 \
    libpopt0 \
    libressl-devel \
    libstdc++6\
    libX11-6 \
    libxml2-tools \
    libxslt1 \
    libX11-devel \
    libXrandr2 \
    lzip \
    lzop \
    kernel-devel \
    maven \
    make \
    megatools \
    Mesa-libGL1 \
    Mesa-libGL-devel \
    mokutil \
    nano \
    neofetch \
    ncurses5-devel \
    ncurses-devel \
    openssl \
    opi \
    patch \
    perl-Digest-SHA1 \
    python \
    python-rpm-generators \
    readline-devel \
    schedtool \
    screenfetch \
    sha3sum \
    squashfs \
    vim \
    wget \
    wireguard-tools \
    xf86-video-intel \
    zip \
    zlib-devel

# Devel Basis on OpenSUSE (https://darryldias.me/2020/devel-basis-on-opensuse-sle/)
zypper install -t pattern devel_basis

# The package libncurses5 is not available, so we need to hack our way by symlinking the required library.
ln -s /usr/lib/libncurses.so.6 /usr/lib/libncurses.so.5
ln -s /usr/lib/libncurses.so.6 /usr/lib/libtinfo.so.5
ln -s /usr/lib64/libncurses.so.6 /usr/lib64/libncurses.so.5
ln -s /usr/lib64/libncurses.so.6 /usr/lib64/libtinfo.so.5

# Repo
echo "Installing Git Repository Tool"
curl --create-dirs -L -o /usr/local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
chmod a+rx /usr/local/bin/repo

echo -e "Setting up udev rules for ADB!"
curl --create-dirs -L -o /etc/udev/rules.d/51-android.rules -O -L https://raw.githubusercontent.com/M0Rf30/android-udev-rules/master/51-android.rules
chmod 644 /etc/udev/rules.d/51-android.rules
chown root /etc/udev/rules.d/51-android.rules
udevadm control --reload-rules

# Set default editor
git config --global core.editor "nano"
