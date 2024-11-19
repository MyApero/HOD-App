rm -rf ios/Pods
rm -rf ios/Podfile.lock
rm -rf ~/.pub-cache/hosted/pub.dartlang.org/
pod cache clean --all
flutter clean
flutter pub get
pod repo update

# Change version of Kotlin in android/settings.gradle
#     id "org.jetbrains.kotlin.android" version "2.0.21" apply false

# Change version of FirebaseFirestore in ios/Podfile
#   pod 'FirebaseFirestore', :git => 'https://github.com/invertase/firestore-ios-sdk-frameworks.git', :tag => '11.2.0'
