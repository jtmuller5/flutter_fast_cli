import 'package:flutterfast_online_auth/app/get_it.dart';
import 'package:flutterfast_online_auth/features/shared/services/connector_service/fast_connector_service.dart';
import 'package:injectable/injectable.dart';

@pocketbase
@Injectable(as: FastConnectorService)
class PocketBaseConnectorService extends FastConnectorService {
  @override
  DateTime? getDateTimeFromTimestamp(dynamic timestamp) {
    return DateTime.tryParse(timestamp);
  }

  @override
  getTimestampFromDateTime(DateTime? dateTime) {
    return dateTime?.toIso8601String();
  }
}
