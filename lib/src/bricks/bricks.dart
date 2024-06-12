import 'dart:io';

import 'package:args/command_runner.dart';

class FastBricks extends Command {
  @override
  String get description => 'List all available Flutter Fast bricks.';

  @override
  String get name => 'bricks';

/*
| Command | Brick | Description |
| --- | --- | --- |
| `fast ads` | [fast_ads](https://cotr.dev/bricks/fast_ads) | Add a banner ad to your app with AdMod |
| `fast biometrics` | [fast_biometrics](https://cotr.dev/bricks/fast_biometrics) | Add biometric authentication to your app |
| `fast feature` | [fast_feature](https://cotr.dev/bricks/fast_feature) | Add an empty feature with ui, models, and services folders |
| `fast notifications` | [fast_notifications](https://cotr.dev/bricks/fast_notifications) | Add push notifications to your app with Firebase Cloud Messaging |
| `fast storage` | [fast_storage](https://cotr.dev/bricks/fast_storage) | Add cloud storage to your app with Firebase Storage, Supabase, or Pocketbase |
| `fast route` | [fast_route](https://cotr.dev/bricks/fast_route) | Add a new route to your app's router |
| `fast feed` | [fast_feed](https://cotr.dev/bricks/fast_feed) | Add a social media feed to your app |
| `fast fetch` | [fast_fetch](https://cotr.dev/bricks/fast_fetch) | Add a data fetching module to your app |
| `fast feedback` | [fast_feedback](https://cotr.dev/bricks/fast_feedback) | Add a feedback module to your app |
| `fast gallery` | [fast_gallery](https://cotr.dev/bricks/fast_gallery) | Add a photo gallery to your app |
| `fast rss` | [fast_rss](https://cotr.dev/bricks/fast_rss) | Add an RSS feed to your app |
| `fast subscriptions` | [fast_subscriptions](https://cotr.dev/bricks/fast_subscriptions) | Monetize your apps on Android and iOS with a RevenueCat integration |
| `fast webview` | [flutter_inappwebview](https://cotr.dev/bricks/flutter_inappwebview) | Add a webview to your app |
| `fast getit` | [get_it](https://cotr.dev/bricks/get-it) | Add a service locator to your app |
| `fast map` | [google_maps_flutter](https://cotr.dev/bricks/google_maps_flutter) | Add a map to your app |
| `fast storage`| [fast_storage](https://cotr.dev/bricks/fast_storage) | Add cloud storage to your app with Firebase Storage, Supabase, or Pocketbase |
| `fast audio` | [just_audio](https://cotr.dev/bricks/just_audio) | Add audio to your app |
| `fast wiredash` | [wiredash](https://cotr.dev/bricks/wiredash) | Add a feedback module to your app |
*/
  @override
  Future<void> run() async {
    stdout.writeln('fast ads - Add a banner ad to your app with AdMod');
    stdout.writeln('fast biometrics - Add biometric authentication to your app');
    stdout.writeln('fast feature - Add an empty feature with ui, models, and services folders');
    stdout.writeln('fast notifications - Add push notifications to your app with Firebase Cloud Messaging');
    stdout.writeln('fast storage - Add cloud storage to your app with Firebase Storage, Supabase, or Pocketbase');
    stdout.writeln('fast route - Add a new route to your app\'s router');
    stdout.writeln('fast feed - Add a social media feed to your app');
    stdout.writeln('fast fetch - Add a data fetching module to your app');
    stdout.writeln('fast feedback - Add a feedback module to your app');
    stdout.writeln('fast gallery - Add a photo gallery to your app');
    stdout.writeln('fast rss - Add an RSS feed to your app');
    stdout.writeln('fast subscriptions - Monetize your apps on Android and iOS with a RevenueCat integration');
    stdout.writeln('fast webview - Add a webview to your app');
    stdout.writeln('fast getit - Add a service locator to your app');
    stdout.writeln('fast map - Add a map to your app');
    stdout.writeln('fast storage - Add cloud storage to your app with Firebase Storage, Supabase, or Pocketbase');
    stdout.writeln('fast audio - Add audio to your app');
    stdout.writeln('fast wiredash - Add a feedback module to your app');
  }
}
