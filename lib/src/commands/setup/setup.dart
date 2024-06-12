import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';

class Setup extends Command {
  @override
  String get description => 'Setup your Flutter Faster development environment. Requires an API key from https://cotr.dev.';

  @override
  String get name => 'setup';

  @override
  List<String> get aliases => ['init', 'start'];

  @override
  ArgParser get argParser {
    return ArgParser()
      ..addOption(
        'key',
        abbr: 'k',
        help: 'Your Flutter Faster API key.',
        valueHelp: 'API KEY',
      );
  }

  @override
  Future<void> run() async {
    File pubspecFile = File('pubspec.yaml');

    if (!pubspecFile.existsSync()) {
      print('This command must be run in the root of a Flutter project.');
      return;
    }

    String? pat = argResults?['key'] as String?;

    if (pat == null) {
      print('You must provide an API key to setup your environment.');
      return;
    }

    File masonFile = File('mason.yaml');

    final String bricks = '''
fast_app:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/fast_app
fast_subscriptions:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/fast_subscriptions
fast_ads:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/fast_ads
fast_data_create:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/fast_data_create
fast_feed:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/fast_feed
fast_biometrics:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/fast_biometrics
fast_chat:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/fast_chat
fast_feature:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/fast_feature
  path: ../ff/bricks/fast_feature
fast_fetch:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/fast_fetch
fast_gallery:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/fast_gallery
fast_rss:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/fast_rss
get_it:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/packages/get_it
fast_route:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/fast_route
wiredash:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/packages/wiredash
flutter_inappwebview:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/packages/flutter_inappwebview
just_audio:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/packages/just_audio
google_maps_flutter:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/packages/google_maps_flutter
fast_sequence:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/fast_sequence
fast_restart:
  git:
    url: https://CodeOTR:$pat@github.com/CodeOTR/ff
    path: bricks/fast_restart''';

    if (!masonFile.existsSync()) {
      masonFile.createSync();

      masonFile.writeAsStringSync('''
bricks:
  $bricks
''');
    } else {
      var masonContents = masonFile.readAsStringSync();

      masonContents = '$masonContents\n$bricks';
    }

    print('Your environment has been setup! Run `fast bricks` to see which bricks are available.');
  }
}
