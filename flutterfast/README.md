# Flutter Fast

A new Flutter project.

## Getting Started

### Firebase Setup

In the root of your project, run the following command:

```
flutterfire config
```

### Config.json

In the assets folder of your project, fill in the missing environment variables in the config.json file.

The following variable will come from RevenueCat:

- GOOGLE_SDK_KEY
- IOS_SDK_KEY
- AMAZON_SDK_KEY

### App Logo

In the assets folder of your project, replace the app_logo.png file with your own app logo. Then run the following command to update the app icon:

```
flutter pub run flutter_launcher_icons
```

## Deployment

### Shorebird

To use Shorebird, follow
the getting started steps in the [official docs](https://docs.shorebird.dev/).

### IOS Screenshots

Devices for [screenshots](https://stackoverflow.com/questions/53297870/wrong-screenshot-size-in-xcode-10-using-simulator):

- 6.5 inch - iPhone 12 Pro Max
- 5.5 inch - iPhone 8 Plus
- iPad Pro (3rd gen) - iPad Pro (12.9 inch)
- iPad Pro(2nd gen) - iPad Pro (12.9 inch)

## Miscellaneous

- Occasionally, you may need to update th distributionUrl in android/gradle/wrapper/gradle-wrapper.properties to the latest version of gradle. You can
  find the latest version [here](https://services.gradle.org/distributions/).