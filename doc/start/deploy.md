---
title: Deploy
description: Use the Flutter Fast build scripts to trigger app builds
---

## Create an Upload Keystore
Follow the instructions [here](https://docs.flutter.dev/deployment/android#signing-the-app) to create an upload keystore for your Android application.

:::note
The `key.properties` file should not be checked into version control. It is included in the .gitignore file in the android folder
:::

## Manually Release First Android App
I know, its sad. Unfortunately, not everything can be automated. If you try to use the Fastlane files to release the first version of your app, you will see this error:

```
Google Api Error: Invalid request - Only releases with status draft may be created on draft app.
```
This [GitHub issue](https://github.com/fastlane/fastlane/discussions/18293) indicates that you only have to manually release a version of your app to the alpha track to start using Fastlane.

## Included Scripts
The Flutter Fast boiler plate comes with convenient bash scripts for building and deploying your app using Fastlane. Run configurations have also been prebuilt for each of these scripts in Android Studio and VS Code.

