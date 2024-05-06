---
title: Build an App
description: Use the Flutter Fast CLI to build an app
---
## Use the CLI
The Flutter Fast CLI has two commands that can be used to build a new Flutter app: app and wizard.

Use the `wizard` command to answer questions about your app one at time:
```bash
fast wizard
```
Otherwise, use the `app` command and specify your options using the run arguments:

```
fast app -n my_app -o com.example
```
Under the hood, the CLI calls `flutter create --empty` to create the basic Flutter app project structure. There allowed arguments are shown here:
| Option | Abbreviation | Description |
| --- | --- | --- | 
| name (required) | n | The name of the Flutter app. This should follow the [Dart package naming conventions](https://dart.dev/tools/pub/pubspec#name) |
| org  (optional) | o | The organization name in reverse domain format |
| paas (optional) | p | The Platform-as-a-Service the app should use. Valid options are "firebase", "supabase", "pocketbase", and "appwrite" |
| abtests (optional) | b | The AB testing platform the app should use. Valid options are "firebase" and "posthog" |
| build (optional) | b | Whether to run the build_runner after the app has been created. Defaults to true. |
| subs (optional) | s | Whether to include subscriptions in the app. Defaults to true. |
| logo-color-scheme (optional) | c | Whether to generate a ColorScheme from your logo. |

Running the above command will create a Flutter application with the required code for _all_ Platform-as-a-Service providers (Firebase, Supabase, and Appwrite). By default, the app will use the Firebase files but you can change this behavior by updating the default "PAAS" string in `get_it.dart`:

```dart
@InjectableInit(
  initializerName: r'$initGetIt', 
  preferRelativeImports: true, 
  asExtension: false, 
)
Future<void> configureDependencies() async => await $initGetIt(
      getIt,
      environment: const String.fromEnvironment('PAAS', defaultValue: 'firebase'), // Change this to supabase
    );
```

Or by running the application with a `--dart-define=PAAS=supabase` argument:
```
flutter run --dart-define=PAAS=supabase
```

## Tool Setup Steps

The Flutter Fast CLI takes care of the Flutter code but you'll still need to setup the peripheral tools you want to use.

For example, if you chose "firebase", you'll need to 
1. Create a Firebase project
2. Run the  `flutterfire config` command
3. Turn on the email auth setting (see more in the Firebase setup section). 

If you chose "supabase", you'll need to perform a similar set of setup steps. 

You can find all setup step instructions in the [Setup Steps](/flutter-fast-guide/setup/overview/) section. This will typically be the slowest part of getting started.

## Replace the App Logo
In the `assets/images` folder there is a placeholder image called logo.png. Replace this image with your own but keep the name the same ("logo.png"). Then, run the following command:

```
flutter pub run flutter_launcher_icons
```

## Run the App
Once the setup steps are complete (and you've added all necessary environment variables to your config.json file), you can run the app. The UI and UX should be nearly identical regardless of the tools you chose. All of the magic happens via abstract services and get_it registration tricks:

- If you're using Firebase, new users will be created using FirebaseAuth and saved to Firestore. 
- If you're using Supabase, new users will be created in Supabase Auth and saved to a "users" table in your Postgres database

## Build your Idea
The generated code is boilerplate so the app may seem empty at first. There are a few built-in features, like profile management, a user feedback form, and simple settings, but that's where it ends. To make it your own, replace the contents in HomeView:
```dart
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:template/app/router.dart';
import 'package:template/app/services.dart';
import 'package:template/features/home/ui/home/widgets/drawer.dart';
import 'home_view_model.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  router.push(const SettingsRoute());
                },
              ),
            ],
          ),
          drawer: const HomeDrawer(),
          body: // Add your own Home widget!
        );
      },
    );
  }
}

```