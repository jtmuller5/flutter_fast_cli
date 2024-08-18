#! /bin/zsh

flutter clean
cd ios && rm -rf Pods Podfile.lock
flutter pub get
cd ios && pod install