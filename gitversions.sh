#/bin/bash
shopt -o -s nounset
set -e
# Quick and dirty script to print the git versions of the
# repositories that the bootloader depends on

function gitdetails {
	echo -e "\ngit rev-parse HEAD:"
	git rev-parse HEAD

	echo -e "\ngit status:"
	git status

	echo -e "\ngit remote -v:"
	git remote -v
	echo ""
}

MBED_PATH=mbed
NRF51822_PATH=nRF51822
BLE_PATH=BLE_API

CWD=$(pwd)

echo "# Base repo (dfu-bootloader) version:"
gitdetails

cd "$MBED_PATH"
echo -e "\n# mbed version"
gitdetails
cd "$CWD"

cd "$NRF51822_PATH"
echo "# nrf51822 version"
gitdetails
cd "$CWD"

cd "$BLE_PATH"
echo "# BLE version"
gitdetails
cd "$CWD"

