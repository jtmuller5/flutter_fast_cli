import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_feature_from_file.dart';

Future<void> removeShorebirdLanes() async {
  await removeFeatureFromFile('Shorebird', 'android/fastlane/Fastfile');
  await removeFeatureFromFile('Shorebird', 'ios/fastlane/Fastfile');
}
