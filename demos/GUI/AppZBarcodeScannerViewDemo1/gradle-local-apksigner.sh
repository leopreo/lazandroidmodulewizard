export PATH=/adt32/sdk/platform-tools:$PATH
export PATH=/adt32/sdk/build-tools/28.0.3:$PATH
export GRADLE_HOME=/adt32/gradle-4.4.1
export PATH=$PATH:$GRADLE_HOME/bin
zipalign -v -p 4 /android/workspace/AppZBarcodeScannerViewDemo1/build/outputs/apk/release/AppZBarcodeScannerViewDemo1-release-unsigned.apk C:\android\workspace\AppZBarcodeScannerViewDemo1/build/outputs/apk/release/AppZBarcodeScannerViewDemo1-release-unsigned-aligned.apk
apksigner sign --ks appzbarcodescannerviewdemo1-release.keystore --out /android/workspace/AppZBarcodeScannerViewDemo1/build/outputs/apk/release/AppZBarcodeScannerViewDemo1-release.apk C:\android\workspace\AppZBarcodeScannerViewDemo1/build/outputs/apk/release/AppZBarcodeScannerViewDemo1-release-unsigned-aligned.apk
