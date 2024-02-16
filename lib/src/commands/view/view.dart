import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:flutter_fast_cli/src/commands/utils/analytics.dart';
import 'package:flutter_fast_cli/src/commands/utils/utils.dart';
import 'package:recase/recase.dart';

class View extends Command {
  @override
  String get description => 'Create a new ViewModel and ViewModelBuilder.';

  @override
  String get name => 'view';

  @override
  ArgParser get argParser {
    return ArgParser()
      ..addOption(
        'name',
        abbr: 'n',
        mandatory: true,
        help: 'The name to prefix to the ViewModel and ViewModelBuilder. Do not include ViewModel or ViewModelBuilder in the name.',
        valueHelp: 'Home',
      )
      ..addOption(
        'feature',
        abbr: 'f',
        help: 'The feature to add the View to.',
        valueHelp: 'Basic',
      );
  }

  @override
  Future<void> run() async {
    stdout.write('Creating new view...\n');

    logAmplitudeEvent('command', {'command': 'view'});

    // Get the current directory
    Directory currentDirectory = Directory.current;

    // Get the name of the feature to create
    String viewName = argResults?['name'].toLowerCase();
    String? featureName = argResults?['feature'];
    String snakeCase = ReCase(viewName).snakeCase;

    if (currentDirectory.parent.path.split('/').last == 'features' && featureName == null) {
      featureName = currentDirectory.path.split('/').last;
    }

    String? path = navigateToFeaturesFolder(currentDirectory, featureName: featureName);

    if (path != null) {
      currentDirectory = Directory(path);
    }

    // List out each folder in the current directory
    List<FileSystemEntity> entities = currentDirectory.listSync();

    if (entities.any((element) => element is Directory && element.path.contains('ui'))) {
      stdout.write('Navigating to ui directory...\n');
      currentDirectory = Directory('${currentDirectory.path}/ui');
    }

    if (currentDirectory.path.split('/').last != 'ui') {
      throw Exception('Could not find ui directory. Either navigate into a feature or specify the feature using the --feature flag.');
    }

    String viewModelCode = '''
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '${snakeCase}_view_model.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeViewModelBuilder(
        builder: (context, model) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Home'),
            ),
            body: Center(
              child: Text('Home'),
            )
          );
        },
      );
  }
}
      '''
        .replaceAll('HomeView', '${ReCase(viewName).pascalCase}View');

    String viewModelBuilderCode = '''
import 'package:simple_mvvm/simple_mvvm.dart';
import 'package:flutter/material.dart';

class HomeViewModelBuilder extends ViewModelBuilder<HomeViewModel> {
  const HomeViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => HomeViewModel();
}

class HomeViewModel extends ViewModel<HomeViewModel> {
   static HomeViewModel of_(BuildContext context) => getModel<HomeViewModel>(context);
}
      '''
        .replaceAll('HomeView', '${ReCase(viewName).pascalCase}View');

    final viewModel = File('${currentDirectory.path}/${snakeCase}_view.dart');
    final viewModelBuilder = File('${currentDirectory.path}/${snakeCase}_view_model.dart');

    await viewModel.writeAsString(viewModelCode, mode: FileMode.write);
    await viewModelBuilder.writeAsString(viewModelBuilderCode, mode: FileMode.write);

    stdout.write('Created ${ReCase(viewName).pascalCase}View and ${ReCase(viewName).pascalCase}ViewModel.');
  }
}
