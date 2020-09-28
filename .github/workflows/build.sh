if [ $# -ne 1 ]; then
  echo "指定された引数は$#個です。" 1>&2
  echo "実行出来る引数は1個です。" 1>&2
  exit 1
fi

SCRIPT_JOB=$1

function archive_without_sign() {
    xcodebuild -workspace NendMoPubCustomEventSample.xcworkspace -scheme $1 \
        -configuration Debug -sdk iphoneos clean archive -archivePath ./out_archive_without_sign/$1.xcarchive \
        CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED="NO" CODE_SIGN_ENTITLEMENTS="" CODE_SIGNING_ALLOWED="NO"
}

function build_simulator() {
    xcodebuild -workspace NendMoPubCustomEventSample.xcworkspace -scheme $1 -configuration Debug -sdk iphonesimulator
}

cd NendMoPubCustomEventSample

if [ "archive" = "${SCRIPT_JOB}" ]; then
    mkdir -p out_archive_without_sign
    archive_without_sign "NendMoPubCustomEventSample"
    archive_without_sign "NendMoPubCustomEventSwiftSample"
    zip -r out_archive_without_sign.zip out_archive_without_sign/
else
    build_simulator "NendMoPubCustomEventSample"
    build_simulator "NendMoPubCustomEventSwiftSample"
fi
