import 'package:injectable/injectable.dart';
import 'package:template/features/shared/services/connector_service/fast_connector_service.dart';
import 'package:template/main.dart';

@supabase
@injectable
class SupabaseConnectorService extends FastConnectorService {
  @override
  DateTime? getDateTimeFromTimestamp(timestamp) {
    return timestamp.toDate();
  }

  @override
  getTimestampFromDateTime(DateTime? dateTime) {
    return dateTime!.toIso8601String();
  }
}
