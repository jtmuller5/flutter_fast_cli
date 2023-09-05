import 'package:cloud_firestore/cloud_firestore.dart';

DateTime? getDateTimeFromTimestamp(Timestamp? value) {
  if (value == null) return null;
  return value.toDate();
}

Timestamp? getTimestampFromDateTime(DateTime? value) {
  if (value == null) return null;
  return Timestamp.fromDate(value);
}