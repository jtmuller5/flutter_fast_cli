import 'dart:io';

Future<void> removeFeatureTags() async{
  try {
    // Replace all instances of feature tags with empty string
    for(String tag in ['Firebase', 'Supabase', 'RSS', 'LogoColorScheme', 'Subscriptions', 'Appwrite']) {
      ProcessResult out = await Process.run(
        'find',
        ['lib', '-type', 'f', '-exec', 'sed', '-i', '', 's#//[*] $tag [*]//##', '{}', ';'],
        workingDirectory: Directory.current.path,
      );
      if (out.stdout != null && out.stdout != '') stdout.write(out.stdout);
      if (out.stderr != null && out.stderr != '') stderr.write(out.stderr);

      out = await Process.run(
        'find',
        ['lib', '-type', 'f', '-exec', 'sed', '-i', '', 's#//x $tag x//##', '{}', ';'],
        workingDirectory: Directory.current.path,
      );
      if (out.stdout != null && out.stdout != '') stdout.write(out.stdout);
      if (out.stderr != null && out.stderr != '') stderr.write(out.stderr);

      /*out = await Process.run(
        'find',
        ['pubspec.yaml', '-type', 'f', '-exec', 'sed', '-i', '', 's/#[*] $tag [*]#//', '{}', ';'],
        workingDirectory: Directory.current.path,
      );
      if (out.stdout != null && out.stdout != '') stdout.write(out.stdout);
      if (out.stderr != null && out.stderr != '') stderr.write(out.stderr);*/
    }
  } catch (e) {
    stderr.writeln(e);
  }
}