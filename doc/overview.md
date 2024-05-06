Flutter Fast apps are designed to give you everything you need (and want) in a starter Flutter app. This page will provide a comprehensive list of the Flutter Fast features.

## Features

### Authentication
Flutter Fast apps use either Firebase or Supabase authentication and come with prebuilt sign in, register, forgot password, and profile screens. Email authentication is supported out-of-the-box and additional methods can be added easily. Authentication based navigation is also built-in so unauthenticated users will be rerouted to the sign in page and newly created users will see the onboarding page.

### Database and Serialization
Flutter Fast apps can use either Firebase Firestore or Supabase Database to store their data. The base boilerplate supports a users collection/table and a feedback collection/table. This code provides some basic examples on how to fetch and save data in these databases.

The boilerplate also supports JSON serialization and defines starter User and Feedback classes. Each of these classes has common properties for their use case (ex. the User class has createdAt, userId, firstName, lastName, and email fields among others). 

### User Management
All new users will be added to the Authentication provider of your choice and then saved to a collection or table with their email and time of creation. We also help you track each user's last login time and provide built in methods to delete accounts.

### Subscriptions
The Flutter Fast boilerplate includes a Subscription service with methods for retrieving and purchasing subscription plans via RevenueCat. The built-in offering page will display a monthly and annual plan with the plan benefits and we've added convenience methods for determining if a user is subscribed or not.

Instructions on how to setup products on Google Play and the App Store can be found in the RevenueCat docs.

### Feedback
Let your users tell you what they want through the built in feedback feature. Users can report bugs, submit feature requests, and leave comments without you having to do anything else. All feedback will be submitted to the PaaS you chose in step one so you can browse it there directly.

Plus, in debug mode you can view the most recent feedback directly in app!

### Crash Reporting
We've setup Sentry crash reporting so you can easily track any errors that happen when your app is deployed. To get setup, simply create a Sentry account and locate your DSN value. We've included instructions on how to find this in the official Flutter Fast docs.

### Analytics Setup
The default boilerplate supports Amplitude analytics on all platforms. You can easily log events with a map of event properties from anywhere inside your app by calling analyticsService.logEvent(). We've included an abstract analytics service that you can extend to use your own analytics tools as well. 

### CI/CD
Each boilerplate app comes with support for Fastlane and has pre-built production and beta lanes. 

On iOS, the "prod" lane builds and automatically submits your iOS app for review. The "beta" lane will increment the build number and upload the app to TestFlight.

On Android, the "prod" lane builds and uploads the app to the production track of Google Play. The "internal" lane will increment the build number and upload the app to the internal test track.

As a bonus, we've also included bash scripts that can be used to trigger Fastlane runs directly from your IDE.

### Service Locator
At the heart of the Flutter Fast architecture is the code_on_the_rocks state management package and get_it. Both of these packages stay close to the Dart language and are extremely simple to set up. code_on_the_rocks provides simple MVVM-based widgets that are used to construct each view while get_it is responsible for managing higher level services required throughout the entire application.

### Dark Mode
Stop wasting time wondering if you should add dark mode! We added it for you. The boilerplate includes a simple settings screen that can be found ender the cog icon on the home page. There is only one setting to start but others can be added underneath. As an added bonus, settings are saved to shared preferences which is registered with get_it and can be accessed from anywhere in the app 🌎

### AI Chat (Firebase Only)
We threw in a basic chatbot that uses the PaLM API. Random? Sure. Cool. Absolutely.

## Quality of Life

### Prebuilt Router
Flutter Fast apps are built with the popular auto_route navigation package. All pre-built routes are auto-registered with the @RoutePage annotation and the router config will be added to the MaterialApp class for you. Additionally, we've included popular route guards and a basic navigation observer tied to the analytics service.

### Theming and Font Styles
Flutter Fast apps will look beautiful from the start. They are built with first hand support for flex_color_scheme themes and Google Fonts. Pick your color palette and font family and enjoy!

### TextStyle Extensions
Easily get all of the built-in theme TextStyles (bodySmall, bodyMedium, bodyLarge, etc) in any built-in color from the colorScheme (primary, onPrimary, secondary, etc) with our cool extensions.

### Gap and Padding Constants
We've put together a robust list of constant gap and padding objects so you can stay in the flow. For instance, just type `gap8`, `p16`, or `py8` to get the spacing you want (and need).

### Fast Logo Replacement
We've included the [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) package to help you quickly update your app's logo. Just replace the `logo.png` file in the assets folder and run `flutter pub run flutter_launcher_icons`.

### Analysis Options
We've included our favorite linting rules to keep your code clean and readable.

### Full Pubspec.yaml
The boilerplate pubspec includes all dependencies relevant to your selected PaaS and includes sections for your assets, launcher icon, and dev dependencies. It's also sorted alphabetically 🔡

### Package Info
Forgot what version of the app your running? Just open the side drawer. We've included the popular [package_info_plus](https://pub.dev/packages/package_info_plus) package and added a version widget at the bottom of the drawer.

### SharedPreferences
SharedPreferences are useful in almost all applications so we've preregistered it with get_it. Access it from anywhere in the app by typing `sharedPrefs`.

### Updated Native Files
Long gone are the days of outdated build.gradle files. The boilerplate Flutter Fast app includes all the necessary permissions and defaultConfig options (I'm looking at you `multiDexEnabled = true`) required to run your app.
 
### Build Scripts
Some people don't like the terminal. To that end, we've included several bash scripts in the generated output so you can build and deploy your app from an IDE.

### Config File Shape
The new and improved way to pass environment variables to your app is to use the --dart-define-from-file argument. We've included a sample `config.json` file with all required environment variables and have designed the boilerplate to use these values via const [String.fromEnvironment()](https://api.flutter.dev/flutter/dart-core/String/String.fromEnvironment.html). Don't worry, the config file is included in the .gitignore.

### Easy Onboarding
A simple onboarding screen can make the first experience a user has with an app 1000x more enjoyable. The first time a user logs into a Flutter Fast app, they will be redirected to a simple, customizable page view where you can introduce them to your app and highlight the cool stuff. To edit the onboarding pages, update the PageOne, PageTwo, and PageThree widgets in the onboarding folder.
