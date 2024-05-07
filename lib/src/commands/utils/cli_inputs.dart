import 'dart:io';

bool getYesNo(String? question, {bool defaultResponse = true}) {
  String? response;
  String defaultResponseString = defaultResponse ? '(Y/n)' : '(y/N)';
  while (response != 'y' && response != 'n') {
    stdout.write('$question $defaultResponseString: ');
    response = stdin.readLineSync();
    if (response == null || response.trim() == '') {
      response = defaultResponse ? 'y' : 'n';
    }
  }

  response = (response ?? (defaultResponse ? 'y' : 'n')).toLowerCase();

  if (response == 'y') {
    return true;
  } else if (response == 'n') {
    return false;
  } else {
    return defaultResponse;
  }
}
