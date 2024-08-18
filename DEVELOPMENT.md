# All In One

```
cd scripts
dart run updateBundles.dart
```

## Update Bundles Overview

1. Runs the createBricks.dart script.
2. Changes the directory to the parent directory.
3. Changes the directory to flutterfast_bricks/bricks.
4. Runs the mason bundle command for fast_app_online_auth.
5. Runs the mason bundle command for fast_app_offline.
6. Copies the new bundle files to /lib/src/bundles.

# Code Changes

1. Open the app you want to modify (in the `templates` directory)
2. Make all desired changes
3. Test locally. For the online flutterfast app, specify the `PAAS` environment variable using --dart-define (one of firebase, supabase, or appwrite)
4. Use flutter_fast_cli to create new app
5. Verify everything looks right
6. Run the following command to copy app to `flutterfast_bricks` directory

```
dart run ./scripts/createBricks.dart
```

7. Run the following command to test the new CLI

```
dart run ./bin/fast.dart app
```

# Variables

- `flutterfast_online_auth`/`flutterfast_offline`: Will be replaced by app name
- `com.cotr`: Will be replaced by package name

# Bundling

1. cd into `flutterfast_bricks` directory
2. cd into `bricks` directory
3. Run one of the following commands

```
mason bundle ./fast_app_online_auth -t dart -o ../bundles
```

```
mason bundle ./fast_app_offline -t dart -o ../bundles
```

# Deploy

1. Increase version number
2. `flutter pub publish --dry-run`
3. `flutter pub publish`