import 'package:flutterfast_online_auth/app/services.dart';

DateTime? getDateTimeFromTimestamp(dynamic value) {
  if (value == null) return null;
  return connectorService.getDateTimeFromTimestamp(value);
}

getTimestampFromDateTime(DateTime? value) {
  if (value == null) return null;
  return connectorService.getTimestampFromDateTime(value);
}
