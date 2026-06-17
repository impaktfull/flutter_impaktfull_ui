#!/bin/bash

flutter clean

cd example
cd ios
rm -rf Pods
rm Podfile.lock
cd ..
cd macos
rm -rf Pods
rm Podfile.lock
cd ..
cd ..

flutter packages get

cd example
cd ios
pod install
cd ..
cd macos
pod install