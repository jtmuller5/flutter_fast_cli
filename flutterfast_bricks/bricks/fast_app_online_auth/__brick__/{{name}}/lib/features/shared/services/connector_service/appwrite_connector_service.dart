import 'package:{{ name }}/app/get_it.dart';
import 'package:{{ name }}/features/shared/services/connector_service/fast_connector_service.dart';
import 'package:injectable/injectable.dart';

@appwrite
@Injectable(as: FastConnectorService)
class AppwriteConnectorService extends FastConnectorService {
  @override
  DateTime? getDateTimeFromTimestamp(dynamic timestamp) {
    return DateTime.tryParse(timestamp);
  }

  @override
  getTimestampFromDateTime(DateTime? dateTime) {
    return dateTime?.toIso8601String();
  }
}