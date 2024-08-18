import 'package:injectable/injectable.dart';
import 'package:{{ name }}/features/monitoring/services/fast_crash_service.dart';

@Singleton(as: FastCrashService)
class CrashService extends FastCrashService {}
