import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// https://pub.dev/packages/injectable#pre-resolving-futures
@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get sharedPrefs => SharedPreferences.getInstance();
}
