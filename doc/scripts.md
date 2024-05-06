Below are all the scripts included in the `scripts` folder of a new Flutter Fast app.

## flutter pub get
```bash
flutter pub get
```

## clean & get
```bash
rm pubspec.lock && flutter pub get
```

### Build Android
```bash
flutter build appbundle --dart-define-from-file=assets/config.json
```

## Android Internal Fastlane
```bash
cd android
fastlane internal
```

## iOS Beta Fastlane
```bash
cd ios
fastlane beta
```