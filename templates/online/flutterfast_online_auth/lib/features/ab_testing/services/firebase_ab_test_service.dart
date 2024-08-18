import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutterfast_online_auth/app/get_it.dart';
import 'package:flutterfast_online_auth/features/ab_testing/services/fast_ab_test_service.dart';
import 'package:injectable/injectable.dart';

@firebase
@LazySingleton(as: FastAbTestService)
class FirebaseAbTestService extends FastAbTestService {
  final remoteConfig = FirebaseRemoteConfig.instance;

  @override
  Future<void> initialize() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    await remoteConfig.setDefaults(Map.fromEntries(ConfigValue.values.map((e) => MapEntry(e.label, e.defaultValue))));
  }

  @override
  Future<bool> isFeatureEnabled(ConfigValue feature) {
    return Future.value(remoteConfig.getBool(feature.label));
  }

  @override
  Future<String> getStringValue(ConfigValue key) {
    return Future.value(remoteConfig.getString(key.label));
  }
}
