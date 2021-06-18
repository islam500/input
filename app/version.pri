VERSION_MAJOR = 0
VERSION_MINOR = 9
VERSION_FIX   = 9

INPUT_VERSION = '$${VERSION_MAJOR}.$${VERSION_MINOR}.$${VERSION_FIX}'

ANDROID_VERSION_SUFFIX = 0
ANDROID_TARGET_ARCH = $$ANDROID_TARGET_ARCH$$

equals ( ANDROID_TARGET_ARCH, 'x86' ) {
  ANDROID_VERSION_SUFFIX = 1
}
equals ( ANDROID_TARGET_ARCH, 'x86_64' ) {
  ANDROID_VERSION_SUFFIX = 2
}
equals ( ANDROID_TARGET_ARCH, 'armeabi-v7a' ) {
  ANDROID_VERSION_SUFFIX = 3
}
equals ( ANDROID_TARGET_ARCH, 'arm64-v8a' ) {
  ANDROID_VERSION_SUFFIX = 4
}

VERSIONCODE = $$format_number($$format_number($${VERSION_MAJOR}, width=2 zeropad)$$format_number($${VERSION_MINOR}, width=2 zeropad)$$format_number($${VERSION_FIX}, width=2 zeropad)$$format_number($${ANDROID_VERSION_SUFFIX}))
ESCAPED_VERSTR = $$replace( INPUT_VERSION, ' ', '\ ' )
DEFINES += "VERSTR=\\\"$${ESCAPED_VERSTR}\\\""
DEFINES += "INPUT_VERSION=$${INPUT_VERSION}"

# android
message( 'Building $${ANDROID_TARGET_ARCH} version $${INPUT_VERSION} ($${VERSIONCODE})' )
ANDROID_VERSION_NAME = $$INPUT_VERSION
ANDROID_VERSION_CODE = $$VERSIONCODE

#ios
QMAKE_FULL_VERSION=VERSIONCODE
QMAKE_SHORT_VERSION=INPUT_VERSION
