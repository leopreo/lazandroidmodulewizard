export JAVA_HOME=${/usr/libexec/java_home}
export PATH=${JAVA_HOME}/bin:$PATH
cd /android/workspace/AppNetApiDemo1
keytool -genkey -v -keystore appnetapidemo1-release.keystore -alias appnetapidemo1.keyalias -keyalg RSA -keysize 2048 -validity 10000 < /android/workspace/AppNetApiDemo1/keytool_input.txt
