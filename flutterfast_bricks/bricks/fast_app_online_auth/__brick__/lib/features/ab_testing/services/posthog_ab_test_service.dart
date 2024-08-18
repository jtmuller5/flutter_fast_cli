import 'package:{{ name }}/app/get_it.dart';
import 'package:{{ name }}/features/ab_testing/services/fast_ab_test_service.dart';
import 'package:injectable/injectable.dart';
import 'package:posthog_flutter/posthog_flutter.dart';

@posthog
@Singleton(as: FastAbTestService)
class PosthogAbTestService extends FastAbTestService {
  @override
  Future<void> initialize() async {}

  @override
  Future<bool> isFeatureEnabled(ConfigValue feature) async {
    return await Posthog().isFeatureEnabled(feature.label);
  }

  @override
  Future<String> getStringValue(ConfigValue key) async {
    return await Posthog().getFeatureFlagPayload(key.label) as String;
  }
}
