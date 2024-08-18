# Flutter Fast

A new Flutter project.

# Getting Started

## Firebase Setup

In the root of your project, run the following command:

```
flutterfire config
```

## Config.json

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

## RevenueCat
Use structured [product IDs](https://www.revenuecat.com/docs/android-products#tips-for-creating-robust-product-ids):

**Google Play**
Product ID: app_entitlement_version

Base Plan: duration-renewaltype (eg. monthly-autorenewing)

**RC Steps:**
1. Locate API keys and add to config.json
2. Create Entitlements
3. Add/Import Products
4. Associate Entitlements with Products
5. Create Offering
6. Add Packages to Offering
7. Add Products to Packages


# Deployment

## Android

### Sign App
```agsl
keytool -genkey -v -keystore ~path/to/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

### First Release
The `flutter build` command defaults to using the release build configuration. To create a release build, run the following command:
```agsl
flutter build appbundle
```

### Subsequent Releases
Run the Fastlanes:
```agsl
cd android
fastlane internal
```

## IOS

### First Release
```agsl
flutter build ipa
```

### Subsequent Releases
Run the Fastlanes:
```agsl
cd ios
fastlane beta
```

### Shorebird

To use Shorebird, follow
the getting started steps in the [official docs](https://docs.shorebird.dev/).

### IOS Screenshots

Devices for [screenshots](https://stackoverflow.com/questions/53297870/wrong-screenshot-size-in-xcode-10-using-simulator):

- 6.5 inch - iPhone 12 Pro Max
- 5.5 inch - iPhone 8 Plus
- iPad Pro (3rd gen) - iPad Pro (12.9 inch)
- iPad Pro(2nd gen) - iPad Pro (12.9 inch)

# Miscellaneous

- Occasionally, you may need to update th distributionUrl in android/gradle/wrapper/gradle-wrapper.properties to the latest version of gradle. You can
  find the latest version [here](https://services.gradle.org/distributions/).