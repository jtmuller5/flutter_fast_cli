import 'package:injectable/injectable.dart';
import 'package:template/app/get_it.dart';
import 'package:template/features/shared/services/connector_service/fast_connector_service.dart';

@supabase
@Injectable(as: FastConnectorService)
class SupabaseConnectorService extends FastConnectorService {
  @override
  DateTime? getDateTimeFromTimestamp(timestamp) {
    return (timestamp is String) ? DateTime.parse(timestamp): timestamp.toDate();
  }

  @override
  getTimestampFromDateTime(DateTime? dateTime) {
    return dateTime!.toIso8601String();
  }
}
