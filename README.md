![Flutter Fast Apps](https://github.com/CodeOTR/flutter_fast_cli/raw/main/assets/flutter-faster-banner.png)

<p align="center">                    
<a href="https://img.shields.io/badge/License-MIT-green"><img src="https://img.shields.io/badge/License-MIT-green" alt="MIT License"></a>
<a href="https://pub.dev/packages/flutter_fast_cli"><img src="https://img.shields.io/pub/v/flutter_fast_cli?label=pub&color=orange" alt="pub version"></a>      
<a href="https://twitter.com/CodeOnTheRocks_">
    <img src="https://img.shields.io/twitter/follow/CodeOnTheRocks_?style=social">
  </a>
 <a href="">
 <img src="https://img.shields.io/github/sponsors/jtmuller5">
 </a>

</p>

<p align="center">
  <a href="https://pub.dev/documentation/flutter_fast_cli/latest/">Documentation</a> •
  <a href="https://cotr.dev/">Code on the Rocks</a> •
  <a href="https://github.com/sponsors/jtmuller5">Support</a> •
  <a href="https://pub.dev/packages/flutter_fast_cli/install">Pub.dev</a>
</p>

<img src="https://github.com/CodeOTR/flutter_fast_cli/raw/main/assets/faster.gif"/>

# Table of Contents

- [Table of Contents](#table-of-contents)
- [Getting Started](#getting-started)
- [What is it?](#what-is-it)
- [Commands](#commands)
  - [General](#general)
- [Documentation](#documentation)
- [Features](#features)
  - [AB Testing](#ab-testing)
  - [Analytics](#analytics)
  - [Authentication](#authentication)
  - [Automation](#automation)
- [Flutter Fast](#flutter-fast)
  - [What is Flutter Fast?](#what-is-flutter-fast)
  - [Why Flutter Fast?](#why-flutter-fast)
    - [Faster Setup](#faster-setup)
    - [Less Lock-in](#less-lock-in)
  - [How Fast?](#how-fast)
- [Flutter Faster](#flutter-faster)

# Getting Started

Activate the CLI:
```bash
dart pub global activate flutter_fast_cli
```

Create your new directory:
```bash
mkdir my_app
cd my_app
```

Create an online app:
```bash
fast app
```

Create an offline app:
```bash
fast app --offline
```

These commands will prompt you for your app name (my_app) and organization (com.example).

The generated app contains code for all third-party services and is thus bloated (eg. don't ship this code). Once you've decided which services you want to use, you can remove the unused code.

For templates that use specific services, see [cotr.dev/flutter-faster]
(https://cotr.dev/flutter-faster).

# What is it?

The Flutter Fast CLI is used to generate either an online or offline app.

The online app supports _all_ of the third-party platforms listed below:

- Firebase
- Supabase
- Appwrite
- Pocketbase
- Amplitude
- Posthog
- Sentry
- Fastlane
- GitHub Actions
- Shorebird
- RevenueCat

The offline app is a stripped-down version of the online app that doesn't require any third-party services.

Once you've generated the app, you can control which platforms are used by modifying the `dart-define` variables used to run the app. For example, to run an app with Firebase and Amplitude, you would run:

```bash
flutter run --dart-define=PAAS=firebase --dart-define=analytics=amplitude
```

# Commands

## General

| Name     | Description                                                 |
| -------- | ----------------------------------------------------------- |
| `app`    | Create a new Flutter Fast app using the step-by-step wizard |
| `build`  | Run `dart run build_runner --delete-conflicting-outputs`    |
| `update` | Update flutter_fast_cli                                     |

To get started, visit the [official docs](https://pub.dev/documentation/flutter_fast_cli/latest/)!

# Documentation

See the API documentation for details on the following topics:

- [Getting started](https://pub.dev/documentation/flutter_fast_cli/latest/topics/Get%20started-topic.html)
- [Firebase](https://pub.dev/documentation/flutter_fast_cli/latest/topics/Firebase-topic.html)
- [Supabase](https://pub.dev/documentation/flutter_fast_cli/latest/topics/Supabase-topic.html)
- [Pocketbase](https://pub.dev/documentation/flutter_fast_cli/latest/topics/Pocketbase-topic.html)
- [AppWrite](https://pub.dev/documentation/flutter_fast_cli/latest/topics/AppWrite-topic.html)
- [Sentry](https://pub.dev/documentation/flutter_fast_cli/latest/topics/Sentry-topic.html)
- [Amplitude](https://pub.dev/documentation/flutter_fast_cli/latest/topics/Amplitude-topic.html)
- [Posthog](https://pub.dev/documentation/flutter_fast_cli/latest/topics/Posthog-topic.html)

# Features

## AB Testing

| Method        | Remote Config | Posthog |
| ------------- | ------------- | ------- |
| Feature Flags | ✅            | ✅      |
| String Values | ✅            | ✅      |

## Analytics

| Method                     | Amplitude | Posthog | Firebase Analytics |
| -------------------------- | --------- | ------- | ------------------ |
| Events                     | ✅        | ✅      | ✅                 |
| User Properties            | ✅        | ✅      | ✅                 |
| User Properties (Set once) | ✅        | ✅      |                    |

## Authentication

| Method         | Firebase | Supabase | Appwrite | Pocketbase |
| -------------- | -------- | -------- | -------- | ---------- |
| Email/Password | ✅       | ✅       | ✅       | ✅         |
| Google         | ✅       | ✅       |          |            |
| Apple          | ✅       | ✅       |          |            |

## Automation

| Method         | Android | iOS | Web |
| -------------- | ------- | --- | --- |
| Fastlane       | ✅      | ✅  | ✅  |
| GitHub Actions | ✅      | ✅  | ✅  |
| Shorebird      | ✅      | ✅  | ✅  |

# Flutter Fast

## What is Flutter Fast?

The Flutter Fast CLI is a tool for generating a starter Flutter application with everything you need to start shipping.

- 🔒 Authentication via [Firebase](https://firebase.google.com/), [Supabase](https://supabase.com/), [Appwrite](https://appwrite.io/), or [PocketBase](https://pocketbase.io/)
- 🌊 Analytics via [Amplitude](https://amplitude.com/) or [Posthog](https://posthog.com/)
- 📊 AB Tests via [Remote Config](https://firebase.google.com/docs/remote-config) or [Posthog](https://posthog.com/)
- 🤖 Crash Reporting via [Sentry](https://sentry.io/welcome/)
- 🏎️ CI/CD via [Fastlane](https://fastlane.tools/)
- 🚀 Lots more!

The Flutter Fast stack is opinionated to enable flexibility of choice regarding third-party technologies. For that reason, the following components of the stack are used regardless of the platform:

- [auto_route](https://pub.dev/packages/auto_route) for navigation
- [get_it](https://pub.dev/packages/get_it) and [injectable](https://pub.dev/packages/injectable) for services

Similarly, Flutter Fast apps use a consistent project structure:

```
├── 📁 lib/
│  ├── 📁 app
│  ├── 📁 features
│  │   ├── 📁 featureOne
│  │   └── 📁 featureTwo
│  │       ├── 📁 models
│  │       ├── 📁 ui
│  │       │   ├── 📄 two_view.dart
│  │       └── 📁 services
│  └── 📄 main.dart
├── 📄 CHANGELOG.md
├── 📄 pubspec.lock
├── 📄 README.md
```

## Why Flutter Fast?

I created Flutter Fast to solve two of my own problems.

### Faster Setup

Nothing puts a damper on my motivation to start a new project like the thought of spending 6 hours setting up a starter project. I wanted to dive straight into the fun part of coding and ship faster 🚢

The Flutter Fast CLI takes care of nearly all the tedious setup involved in creating a user-based application. The longest part of getting started is setting up the peripheral tools (ex. Firebase, Supabase, Amplitude, etc).

### Less Lock-in

I love experimenting. I love writing about different tech stacks and understanding how competing tools work. With that in mind, the second goal of the Flutter Fast CLI was to create a tool that wouldn't depend on a single platform. While the CLI is still a work in progress, a few examples of this flexibility are ready for use:

- Choose to use either Firebase, Supabase, Pocketbaso, or AppWrite as your PaaS
- Choose between Amplitude and Posthog for analytics
- Choose between Sentry and Firebase Crashlytics for crash reporting

You can view the [roadmap](https://pub.dev/documentation/flutter_fast_cli/latest/topics/Roadmap-topic.html) to see additional platforms we plan to support.

## How Fast?

Below is an incomplete list of all the things the Flutter Fast CLI does for you:

- Sets up Sign In, Register, Forgot Password, and Profile screens
- SSO with Google and Apple
- Adds a settings screen with dark mode toggle
- Adds a simple onboarding view new users see on account creation
- Creates a router using auto_route, go_router, or the vanilla navigator and adds it to your MaterialApp
- Introduces authentication based navigation and route guards
- Creates an instance of [get_it](https://pub.dev/packages/get_it)
- Auto registers services in get_it using [injectable](https://pub.dev/packages/injectable) (optional)
- Adds an `analysis_options.yaml` file
- Creates a complete `pubspec.yaml` file with necessary dependencies based on config value
- Adds the flutter_launcher_icon package and code snippet to quickly swap out logo (includes logic to remove alpha channel on iOS)
- Sets up Sentry for crash reporting
- Adds a basic debugging NavigationObserver to router
- Creates useful TextStyle and BuildContext extensions
- Creates `constants.dart` file with reusable padding and gap values
- Adds basic bash scripts with preconfigured run configurations for Fastlane and common Flutter tasks
- Includes Android and iOS Fastlane files with Flutter-safe methods for incrementing build numbers (doesn't wipe out $(FLUTTER_BUILD_NUMBER))
- Adds `multiDexEnabled = true` to app/build.gradle
- Performs [release signing setup](https://docs.flutter.dev/deployment/android#signing-the-app) and creates empty `key.properties` file
- Includes [package_info_plus](https://pub.dev/packages/package_info_plus) file and adds version string to home drawer
- Includes support for [flex_color_scheme](https://pub.dev/packages/flex_color_scheme) and [google_fonts](https://pub.dev/packages/google_fonts) 🎨
- Includes boilerplate for generating ColorScheme from image
- Sets up `config.json` file to be used with --dart-define-from-file run argument
- Includes support for setting app and organization name at generation time
- Adds [json_serializable](https://pub.dev/packages/json_serializable) and [json_annotation](https://pub.dev/packages/json_annotation) dependencies
- Creates a `README.md` file with helpful deploy tips (stuff I always forget)
- Creates abstract service classes for easy extensibility
- Runs `flutter pub run build_runner build --delete-conflicting-outputs` and `dart format .` so projects are run-ready

# Flutter Faster

The `fast app` command gives you just about everything you need to launch a cross-platform Flutter app...but sometimes that's not enough. The Flutter Faster brick pack is an ever-expanding library of Mason bricks that can accelerate your development process. There are 30+ bricks for adding features, screens, and pizzazz:

- Subscription service (fast_subscriptions)
- User feedback screen (fast_feedback)
- Google maps setup (google_maps_flutter)
- Biometric sign in (fast_biometrics)
- Pre-built RSS feed module
- Pre-build AI Chat module (for Firebase builds)
- A generic Feedback feature that works out-of-the-box with Firestore, Supabase, Pocketbase or Appwrite
- Adds billing dependency to app/build.gradle for subscription apps
- Plus lots more

To get all of the bricks, as well as lifetime updates and all future bricks that are added, check out our [website](https://cotr.dev/flutter-faster)!
