import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> logAmplitudeEvent(String eventName, [Map<String, dynamic>? properties]) async {
  var url = Uri.parse('https://api2.amplitude.com/2/httpapi');

  await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'api_key': '6b620def2f03cac6cee826b17992790d',
      'events': [
        {
          'user_id': 'flutterfast',
          'platform': 'cli',
          'event_type': eventName,
          'event_properties': properties ?? {},
        },
      ],
    }),
  );
}
