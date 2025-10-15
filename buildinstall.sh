#!/bin/bash
set -e
cd "$(dirname "$0")"
IPHONE_IP="192.168.1.160"
DEB_PATH="./packages/*.deb"
REMOTE_PATH="/var/root/"

make clean
rm -f packages/*.deb

echo "Building tweak..."
make package

echo "Cleaning old packages on device..."
ssh -oHostKeyAlgorithms=+ssh-rsa root@$IPHONE_IP "rm -f ${REMOTE_PATH}*.deb" || {
    echo "Warning: Failed to clean old packages, continuing..."
}

echo "Copying new package..."
scp -oHostKeyAlgorithms=+ssh-rsa $DEB_PATH root@$IPHONE_IP:$REMOTE_PATH

echo "Copying icon..."
ssh -oHostKeyAlgorithms=+ssh-rsa root@$IPHONE_IP "mkdir -p /usr/share/icons/"
scp -oHostKeyAlgorithms=+ssh-rsa fd7-icon.png root@$IPHONE_IP:/usr/share/icons/

echo "Installing package on device..."
ssh -oHostKeyAlgorithms=+ssh-rsa root@$IPHONE_IP "
    if dpkg -i ${REMOTE_PATH}*.deb; then
        echo 'Package installed successfully.'
        killall SpringBoard
    else
        echo 'Error: Package installation failed.'
        exit 1
    fi
"

echo "Done."