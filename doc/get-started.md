# Installation

## Like It
![Flutter Fast product](ff-product.png)

You can view the Flutter Fast CLI on [pub.dev](https://pub.dev/packages/flutter_fast_cli). Give it a 👍 if you like it!

## Activate It
Since the CLI is hosted on pub.dev, you can activate it directly from your terminal:

```
dart pub global activate flutter_fast_cli
```

You can further verify that the CLI has been activated by [listing your active Dart packages](https://dart.dev/tools/pub/cmd/pub-global#listing-active-packages):
```
dart pub global list
```

You should see an entry for `flutter_fast_cli` with the newest version listed on pub.

## Uninstall It
If you want to [uninstall the CLI](https://dart.dev/tools/pub/cmd/pub-global#deactivating-a-package), run the following command:
```
dart pub global deactivate flutter_fast_cli
```

# Build

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
Under the hood, the CLI calls `flutter create --empty` to create the basic Flutter app project structure. The allowed arguments are shown here:
| Option | Abbreviation | Description |
| --- | --- | --- | 
| name (required) | n | The name of the Flutter app. This should follow the [Dart package naming conventions](https://dart.dev/tools/pub/pubspec#name) |
| org  (optional) | o | The organization name in reverse domain format |
| paas (optional) | p | The Platform-as-a-Service the app should use. Valid options are "firebase", "supabase", "pocketbase", and "appwrite" |
| abtests (optional) | b | The AB testing platform the app should use. Valid options are "firebase" and "posthog" |
| subs (optional) | s | Whether to include subscriptions in the app. Defaults to true. |

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
3. Turn on the email auth setting (see more in the [Firebase setup section](https://pub.dev/documentation/flutter_fast_cli/1.6.8/topics/Firebase-topic.html)). 

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

# Update

To update the CLI, simply activate it again:

```
dart pub global activate flutter_fast_cli
```

Once the CLI is updated, you can check the version by [listing your active Dart packages](https://dart.dev/tools/pub/cmd/pub-global#listing-active-packages). The package version will be next to the `flutter_fast_cli` name:

```
dart pub global list

...

flutter_fast_cli 1.0.1
```

# Deploy

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