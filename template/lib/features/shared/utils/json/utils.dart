import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:template/app/services.dart';

DateTime? getDateTimeFromTimestamp(dynamic value) {
  if (value == null) return null;
  return connectorService.getDateTimeFromTimestamp(value);
}

getTimestampFromDateTime(DateTime? value) {
  if (value == null) return null;
  return connectorService.getTimestampFromDateTime(value);
}