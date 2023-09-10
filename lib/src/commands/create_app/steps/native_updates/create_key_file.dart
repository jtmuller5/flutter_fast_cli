import 'dart:io';

Future<void> createKeyFile() async{
  File keyProperties = File('android/key.properties');

  await keyProperties.writeAsString('''
storePassword=<password-from-previous-step>
keyPassword=<password-from-previous-step>
keyAlias=upload
storeFile=<keystore-file-location>
''');
}