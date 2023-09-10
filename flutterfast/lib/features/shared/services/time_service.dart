import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Injectable service for Durations, DateTimes, and displaying formatted timestamps
class TimeService {
  MaterialLocalizations getLocalization(BuildContext context) {
    return MaterialLocalizations.of(context);
  }

  String getFormattedText(Duration? duration,
      {bool showHours = true, bool showMillis = true}) {
    if (duration != null) {
      String twoDigits(int n) => n.toString().padLeft(2, "0");
      String twoDigitMilliseconds =
          twoDigits(duration.inMilliseconds.remainder(60));
      String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
      if (showHours) {
        return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds${(showMillis ? '.$twoDigitMilliseconds' : '')}";
      } else {
        return "$twoDigitMinutes:$twoDigitSeconds${(showMillis ? '.$twoDigitMilliseconds' : '')}";
      }
    } else {
      return '00:00:00';
    }
  }

  DateTime getDateWithoutTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  DateTime getDateWithoutTimeZone(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour,
        dateTime.minute);
  }

  String getTime(DateTime? dateTime) {
    String convertedTime;

    if (dateTime != null) {
      convertedTime = DateFormat('HH:mm:ss').format(dateTime);

      return convertedTime;
    } else {
      debugPrint('no start yet');
      return '';
    }
  }
}
