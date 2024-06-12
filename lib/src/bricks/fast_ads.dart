import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';

class FastAds extends Command {
  @override
  String get description => 'Add ads to your Flutter app with AdMob.';

  @override
  String get name => 'ads';

  @override
  ArgParser get argParser {
    return ArgParser()
      ..addOption(
        'android_app_id',
        abbr: 'a',
        help: 'The android app ID for the ad network.',
        valueHelp: 'ca-app-pub-3940256099942544/2934735716',
      )
      ..addOption(
        'ios_app_id',
        abbr: 'i',
        help: 'The iOS app ID for the ad network.',
        valueHelp: 'ca-app-pub-3940256099942544/2934735716',
      );
  }

/*
 android_app_id:
    type: string
    description: The android app ID for the ad network
    default: ca-app-pub-3940256099942544/2934735716
    prompt: What is your android app ID for the ad network? (e.g. ca-app-pub-3940256099942544/2934735716)
  ios_app_id:
    type: string
    description: The iOS app ID for the ad network
    default: ca-app-pub-3940256099942544/2934735716
    prompt: What is your iOS app ID for the ad network? (e.g. ca-app-pub-3940256099942544/2934735716)  
*/
  @override
  Future<void> run() async {
    String? androidAppId = argResults?['android_app_id'] as String?;
    String? iosAppId = argResults?['ios_app_id'] as String?;

    androidAppId ??= await _prompt('What is your android app ID for the ad network? (e.g. ca-app-pub-3940256099942544/2934735716)');

    iosAppId ??= await _prompt('What is your iOS app ID for the ad network? (e.g. ca-app-pub-3940256099942544/2934735716)');

    if (androidAppId == null || iosAppId == null) {
      print('You must provide an android and iOS app ID to add ads to your app.');
      return;
    }

    var process = await Process.run('mason', [
      'make',
      'fast_ads',
      '--android_app_id',
      androidAppId,
      '--ios_app_id',
      iosAppId,
    ]);
  }
}

Future<String?> _prompt(String prompt) async {
  stdout.write('$prompt ');
  return stdin.readLineSync();
}
