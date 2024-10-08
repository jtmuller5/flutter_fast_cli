## 3.0.3
- 🟪 Fixed missing documentation
- *Date:* 8-17-2024

## 3.0.1
- 🟪 Fixed misnamed directories in native apps
- 🟪 Added missing Amplitude and Posthog code to `web/index.html`
- 🟪 Fixed broken navigation with Firebase authentication
- 🟩 Added `--fresh` option to generate online app without Flutter Fast Firebase setup
- *Date:* 8-17-2024

## 3.0.0
- 🟨 `fast app` now generates Flutter app with all third-party implementations
- 🟩 Added `--offline` option to generate Flutter app with basic Flutter Fast architecture
- *Date:* 8-17-2024

## 2.0.2
- 🟨 `fast app` now generates complete flutter app
- *Date:* 6-13-2024

## 2.0.1
- 🟩 Update README
- *Date:* 6-12-2024

## 2.0.0
- 🟩 Flutter Faster
- *Date:* 6-12-2024

## 1.6.12
- 🟩 Added Roadmap
- 🟪 Fixed broken doc links
- *Date:* 5-7-2024

## 1.6.11
- 🟩 Added Firebase Analytics as analytics option
- 🟩 Implemented `updateVersionId` in all analytics services
- 🟩 Added ReCase class for string manipulation
- 🟨 Automated setting of analytics environment in `get_it`
- 🟪 Fixed Google sign in with Supabase on web
- *Date:* 5-7-2024

## 1.6.10
- 🟩 Add docs to pub
- *Date:* 5-6-2024

## 1.6.0
- 🟩 Added Firebase Remote Config and Posthog options for AB Testing
- 🟪 Fixed copying of `info.plist` file
- 🟪 Remove unused subscriptions code when opting out of subscriptions
- *Date:* 5-6-2024

## 1.5.7
- 🟪 Copy AndroidManifest values for Posthog
- *Date:* 5-5-2024

## 1.5.6
- 🟨 Update dependencies
- 🟪 Implemented chat service functions for Firebase and Pocketbase
- *Date:* 5-5-2024

## 1.5.5
- 🟪 Fixed broken asset references
- *Date:* 2-21-2024

## 1.5.4
- 🟩 Added official brand logos for [Apple](https://developer.apple.com/design/resources/) and [Google](https://developers.google.com/identity/branding-guidelines)
- 🟩 Google and Apple Sign in on web
- 🟩 Added Breakpoints class
- 🟨 Updated Home view to be responsive with drawer, rail, and side bar
- *Date:* 2-21-2024

## 1.5.3
- 🟩 Added Google Sign In for Appwrite (Android + iOS)
- 🟩 Apple Sign In for Appwrite (Android + iOS)
- 🟪 Fixed feedback and chat database queries for Appwrite
- *Date:* 2-19-2024

## 1.5.2
- 🟩 Add "upgrade" alias to `update` command.
- *Date:* 2-16-2024

## 1.5.1
- 🟩 CLI analytics
- 🟩 Reset password setup
- *Date:* 2-16-2024

## 1.5.0
- 🟩 Google Sign In for Firebase (Android + iOS)
- 🟩 Google Sign In for Supabase (Android + iOS)
- 🟩 Apple Sign In for Firebase (Android + iOS)
- 🟩 Apple Sign In for Supabase (Android + iOS)
- 🟩 Added `last_login` field to FastUser model
- 🟨 Added navigation arguments so email/password are passed between sign in and sign up views
- 🟨 Updated README
- *Date:* 2-16-2024

## 1.4.9
- 🟪 `fast feature` will now create initial View with feature name
- 🟨 Updated README
- *Date:* 2-4-2024

## 1.4.8
- 🟨 Updated README
- *Date:* 2-4-2024

## 1.4.7
- 🟩 Added `feature`, `view`, and `update` commands
- *Date:* 2-4-2024

## 1.4.6
- 🟪 Errors from `fast build` will now appear in terminal
- 🟨 Updated dependencies
- 🟨 Switched from `flutter_lints` to [lints](https://pub.dev/packages/lints) 
- 🟩 Added [sort_pub_dependencies](https://dart.dev/tools/linter-rules/sort_pub_dependencies) lint to `analysis_options.yaml`
- *Date:* 2-3-2024

## 1.4.5
- 🟪 Fixed step that removes non PocketBase code references
- 🟩 Added PocketBase dev URL to `config.json` (http://127.0.0.1:8090)
- *Date:* 1-26-2024

## 1.4.4
- 🟪 Fixed copying of .vscode folder
- *Date:* 1-26-2024

## 1.4.3
- 🟪 Updated Readme
- *Date:* 1-24-2024

## 1.4.2
- 🟩 Added PocketBase Integration 
- 🟩 Added SkeletonBox for loading animations 
- 🟩 Added PopUpMenuButton with "Delete Account" action in profile
- 🟩 Added Config class for app name, subtitle, privacy policy, and terms of service link
- 🟩 Added `showSnackBar` method to DialogService
- 🟩 Added `config.dart` file for aggregating app strings
- 🟪 Removed hard coded background color on auth screens
- 🟪 Fixed TextEditingController instantiation on SignInView
- *Date:* 1-24-2024

## 1.4.1
- 🟩 Added [ITSAppUsesNonExemptEncryption](https://stackoverflow.com/a/35895077/12806961) to Info.plist 
- 🟩 Added DialogService with built-in confirmAction method
- *Date:* 1-1-2024

## 1.4.0
- 🟥 Removed Auth UI libraries
- 🟩 Added Sign In, Register, Profile, and Forgot Password views
- 🟩 Added `phone` and `onboarded` properties to FastUser
- 🟩 Added ValueNotifier<FastUser> to UserService
- 🟩 Added MaskTextInputFormatter for easy phone formatting
- 🟥 Removed reference to "USD" so app passes localization check on app stores
- 🟪 Updated Supabase dependency to 2.0.2
- 🟪 Added `includeIfNull: false` to all models. This prevents data from being overwritten in Supabase
- *Date:* 1-1-2024

## 1.3.7
- 🟪 Fix for using non-firebase builds. Clear Cloud Firestore dependencies and other remnants
- *Date:* 9-26-2023

## 1.3.6
- 🟪 Fix for using Supabase/Appwrite auth
- *Date:* 9-26-2023

## 1.3.5
- 🟪 Fix for [Windows issue](https://github.com/CodeOTR/flutter_fast_cli/issues/3). Replaced "find" and "sed" commands with Dart code.
- 🟩 Added TOS and Privacy policy links to side drawer
- *Date:* 9-26-2023

## 1.3.4
- 🟩 Added wizard gif
- *Date:* 9-20-2023

## 1.3.3
- 🟪 Fix for fixed missing runConfigurations directory
- *Date:* 9-20-2023

## 1.3.2
- 🟪 Fixed missing runConfigurations directory
- *Date:* 9-20-2023

## 1.3.1
- 🟪 Error handling for missing runConfigurations directory
- *Date:* 9-20-2023

## 1.3.0
- 🟩 Added --offline argument to `fast app` command
- 🟩 Added empty .env file to ios fastlane directory
- 🟩 Wrapped Drawer contents in SafeArea
- 🟪 Added error handling for missing Amplitude API key
- *Date:* 9-20-2023

## 1.2.1
- 🟩 Added workaround for [this Fastlane issue](https://github.com/fastlane/fastlane/issues/21507)
- 🟪 Fixed scripts not being copied into new app
- 🟪 Fixed run configurations not being copied into new app
- 🟪 Added error output when `fast build` fails
- *Date:* 9-19-2023

## 1.2.0
- 🟩 Added `wizard` command
- 🟪 Fixed background color in subscription popup
- *Date:* 9-18-2023

## 1.1.4
- 🟪 Fixed generator so it creates `config.json` in assets folder
- *Date:* 9-17-2023

## 1.1.3
- 🟥 Removed state management library
- 🟥 Removed unnecessary Home tile in side drawer
- 🟩 Added bottom navigation bar on HomeView
- *Date:* 9-17-2023

## 1.1.2
- 🟩 Added option to generate ColorScheme from image (-l)
- 🟩 Added step to remove feature tags from lib directory (ex. //* Firebase *//)
- 🟩 Added basic Monarch stories for onboarding pages
- 🟨 Updated onboarding pages to have title and subtitle with animation
- 🟪 Fixed contrast issue in FeatureTile text
- *Date:* 9-16-2023

## 1.1.1
- 🟪 Fixed crash when running `fast app` with -p firebase flag
- *Date:* 9-15-2023

## 1.1.0
- 🟩 Added Appwrite support
- 🟩 Added Shorebird Fastlanes
- 🟩 Added `fast build` command
- 🟨 Updated default app icon
- *Date:* 9-15-2023

## 1.0.6
- 🟪 Fixed CLI for Windows (thanks @carmas123)
- *Date:* 9-13-2023

## 1.0.5
- 🟩 Added runWithProgress utility function
- 🟪 Fixed exception when clean command is used outside of Flutter project
- *Date:* 9-10-2023

## 1.0.4
- 🟩 Added "clean" command to deep clean Flutter projects
- *Date:* 9-10-2023

## 1.0.3
- 🟩 Android release signing setup with empty key.properties
- 🟩 Added Android Studio run configuration and VS code launch.json file
- 🟩 Added basic Flutter scripts
- 🟨 Moved existing Android Studio run configurations into template path. No more manually updating paths
- 🟪 Fixed how BuildContext was acquired in FastColor extension
- *Date:* 9-09-2023

## 1.0.2
- 🟥 Removed dependency on uuid package for Supabase builds
- 🟩 Created DashboardView as new default widget on home page
- 🟩 FastColor extension for accessing ColorScheme colors
- 🟩 Added MacOS entry to flutter_launcher_icons
- 🟨 Updated template name and org to flutterfast and com.cotr, respectively
- 🟨 Changed flutter_icons to flutter_launcher_icons in pubspec.yaml
- *Date:* 9-08-2023

## 1.0.1
- 🟩 Added --subs (and --no-subs) flag to turn the subscriptions feature off
- 🟩 Added --build (and --no-build) flag to turn off build step in app generation
- 🟨 Improved the built-in SubscriptionsView to handle any Offering setup in RevenueCat
- *Date:* 9-07-2023

## 1.0.0
- 🟩 Initial pre-release
- *Date:* 9-06-2023

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

# Types of Changes
- 🟩 Added
- 🟨 Changed
- 🟧 Deprecated
- 🟥 Removed
- 🟪 Fixed
- 🟦 Security