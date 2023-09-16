import 'package:flutter_fast_cli/src/commands/create_app/steps/cleanup/remove_feature_from_file.dart';

Future<void> removeLogoColorScheme() async {
  await removeFeatureFromFile('LogoColorScheme', 'lib/main.dart');
  await removeFeatureFromFile('LogoColorScheme', 'lib/app/theme.dart');
}
