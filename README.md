![Flutter Fast Apps](https://github.com/CodeOTR/flutter_fast_cli/raw/main/assets/flutter-fast-banner.png)

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
  <a href="https://codeotr.github.io/flutter-fast-guide/">Documentation</a> •
  <a href="https://codeontherocks.dev/">Code on the Rocks</a> •
  <a href="https://github.com/sponsors/jtmuller5">Support</a> •
  <a href="https://pub.dev/packages/flutter_fast_cli/install">Pub.dev</a>
</p>

<img src="https://github.com/CodeOTR/flutter_fast_cli/raw/main/assets/Wizard.gif"/>

# Table of Contents

- [Table of Contents](#table-of-contents)
- [Getting Started](#getting-started)
- [Commands](#commands)
- [Features](#features)
  - [AB Testing](#ab-testing)
  - [Analytics](#analytics)
  - [Authentication](#authentication)
  - [Automation](#automation)
  - [Monetization](#monetization)
- [Flutter Fast](#flutter-fast)
  - [What is Flutter Fast?](#what-is-flutter-fast)
  - [Why Flutter Fast?](#why-flutter-fast)
    - [Faster Setup](#faster-setup)
    - [Less Lock-in](#less-lock-in)
  - [How Fast?](#how-fast)
  - [Who is this for?](#who-is-this-for)

# Getting Started

```bash
dart pub global activate flutter_fast_cli
```

```bash
fast wizard
```

# Commands

| Name      | Description                                                       |
| --------- | ----------------------------------------------------------------- |
| `app`     | Create a new Flutter Fast app                                     |
| `wizard`  | Create a new Flutter Fast app using the step-by-step wizard       |
| `build`   | Run `dart run build_runner --delete-conflicting-outputs`          |
| `feature` | Create a new feature with ui, services, and models subdirectories |
| `view`    | Create a new View for a feature                                   |
| `update`  | Update flutter_fast_cli                                           |
| `clean `  | Run flutter clean (use -i to clean ios folder)                    |

To get started, visit the [official docs](https://codeotr.github.io/flutter-fast-guide/)!

# Features

## AB Testing
|  Method |  Remote Config | Posthog |
| --- | --- | --- |
| Feature Flags | ✅ | ✅ |
| String Values | ✅ | ✅ |

## Analytics
|  Method |  Amplitude | Posthog |
| --- | --- | --- |
| Events | ✅ | ✅ |
| User Properties | ✅ | ✅ |
| User Properties (Set once) | ✅ | ✅ |

## Authentication
|  Method | Firebase | Supabase | Appwrite | Pocketbase |
| --- | --- | --- | --- | --- |
| Email/Password | ✅ | ✅ | ✅ | ✅ |
| Google | ✅ | ✅ |  |  |
| Apple | ✅ | ✅  |  |  |

## Automation
|  Method | Android | iOS | Web |
| --- | --- | --- | --- |
| Fastlane | ✅ | ✅ | ✅ |
| GitHub Actions | ✅ | ✅ | ✅ |
| Shorebird | ✅ | ✅ | ✅ |

## Monetization
|  Method | RevenueCat | 
| --- | --- | 
| Subscriptions | ✅ |  
| In-App Purchases |  |  

# Flutter Fast

## What is Flutter Fast?

The Flutter Fast CLI is a tool for generating a starter Flutter application with everything you need to start shipping.

- 🔒 Authentication via [Firebase](https://firebase.google.com/), [Supabase](https://supabase.com/), [Appwrite](https://appwrite.io/), or [PocketBase](https://pocketbase.io/)
- 💸 Subscriptions via [RevenueCat](https://www.revenuecat.com/)
- 🌊 Analytics via [Amplitude](https://amplitude.com/) or [Posthog](https://posthog.com/)
- 🤖 Crash Reporting via [Sentry](https://sentry.io/welcome/)
- 🏎️ CI/CD via [Fastlane](https://fastlane.tools/)
- 🚀 Lots more!

The Flutter Fast stack is opinionated in order to make building as fast as possible. For that reason, the following components of the stack can not be substituted (for now):

- [auto_route](https://pub.dev/packages/auto_route) for navigation
- [get_it](https://pub.dev/packages/get_it) and [injectable](https://pub.dev/packages/injectable) for services
- [simple_mvvm](https://pub.dev/packages/simple_mvvm) for state management

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
│  │       │   └── 📄 two_view_model.dart
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

- Choose to use either Firebase or Supabase as your PaaS
- Opt into including Subscriptions

You can view the [roadmap](https://codeotr.github.io/flutter-fast-guide/roadmap/plan/) to see additional platforms we plan to support.

## How Fast?

Below is an incomplete list of all the things the Flutter Fast CLI does for you:

- Sets up Sign In, Register, Forgot Password, and Profile screens
- SSO with Google and Apple
- Adds a generic Feedback feature that works out-of-the-box with Firestore, Supabase, or Appwrite
- Adds a settings screen with dark mode toggle
- Adds a simple onboarding view new users see on account creation
- Creates an auto_route router and adds it to your MaterialApp
- Introduces authentication based navigation and route guards
- Creates an instance of [get_it](https://pub.dev/packages/get_it)
- Auto registers services in get_it using [injectable](https://pub.dev/packages/injectable)
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
- Adds billing dependency to app/build.gradle for subscription apps
- Performs [release signing setup](https://docs.flutter.dev/deployment/android#signing-the-app) and creates empty `key.properties` file
- Includes [package_info_plus](https://pub.dev/packages/package_info_plus) file and adds version string to home drawer
- Includes support for [flex_color_scheme](https://pub.dev/packages/flex_color_scheme) and [google_fonts](https://pub.dev/packages/google_fonts) 🎨
- Includes boilerplate for generating ColorScheme from image
- Pre-built RSS feed module
- Pre-build AI Chat module (for Firebase builds)
- Sets up `config.json` file to be used with --dart-define-from-file run argument
- Includes support for setting app and organization name at generation time
- Adds [json_serializable](https://pub.dev/packages/json_serializable) and [json_annotation](https://pub.dev/packages/json_annotation) dependencies
- Creates a `README.md` file with helpful deploy tips (stuff I always forget)
- Creates abstract service classes for easy extensibility
- Runs `flutter pub run build_runner build --delete-conflicting-outputs` and `dart format .` so projects are run-ready

## Who is this for?

The Flutter Fast CLI is for anyone who wants to ship a Flutter app fast.

It's also a good tool for experimenting with different stacks and learning how to integrate different tools into your Flutter app.
