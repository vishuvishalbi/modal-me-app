ionic cordova plugin add cordova-plugin-contacts --save
npm install @ionic-native/contacts --save 

ionic cordova plugin add cordova-plugin-camera --save
npm install @ionic-native/camera --save

ionic cordova plugin add cordova-plugin-firebase-authentication --save
npm install @ionic-native/firebase-authentication --save

npm install @angular/fire firebase @ionic-native/firebase-authentication --save

npm install @ionic-native/http --save
ionic cordova plugin add cordova-plugin-advanced-http

ionic cordova plugin add cordova-plugin-screen-orientation --save
npm install ionic-native/screen-orientation --save

echo 'export PATH=/Users/vishu/.npm-global/bin/' >> ~/.bash_profile

echo 'export ANDROID_HOME=/Users/$USER/Library/Android/sdk' >> ~/.bash_profile
echo 'export PATH=/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/bin:${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/29.0.2' >> ~/.bash_profile

/usr/bin:/usr/sbin:/bin:/sbin


rm modal-release-unsigned.apk
rm modal.apk
cp ./platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk ./modal-release-unsigned.apk

keytool -genkey -v -keystore modal.keystore -alias modal.me -keyalg RSA -keysize 2048 -validity 1000

keytool -genkey -v -keystore my-release-key.keystore -alias modal -keyalg RSA -keysize 2048 -validity 10000

keytool -importkeystore -srckeystore modal.keystore -destkeystore modal.keystore -deststoretype pkcs12

jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore modal.keystore modal-release-unsigned.apk modal.me
123456
/Users/vishu/Library/Android/sdk/build-tools/29.0.2/zipalign -v 4 modal-release-unsigned.apk modal.apk
/C/Users/vishy/AppData/Local/Android/Sdk/build-tools/29.0.2/zipalign.exe -v 4 modal-release-unsigned.apk modal.apk

keytool -list -v -keystore modal.keystore -alias modal.me

keytool -list -v -keystore my-release-key.keystore -alias modal

jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore modal.keystore modal-release-unsigned.apk modal
