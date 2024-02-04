import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:flutter_fast_cli/src/commands/utils/utils.dart';
import 'package:recase/recase.dart';

class Feature extends Command {
  @override
  String get description => 'Add a new feature folder with ui, services, and models subdirectories';

  @override
  String get name => 'feature';

  @override
  ArgParser get argParser {
    return ArgParser()
      ..addOption(
        'name',
        abbr: 'n',
        help: 'The name of the feature to create.',
        mandatory: true,
      );
  }

  @override
  Future<void> run() async {
    stdout.write('Creating new feature...\n');

    // Get the current directory
    Directory currentDirectory = Directory.current;

    String? path = navigateToFeaturesFolder(currentDirectory);

    if (path != null) {
      currentDirectory = Directory(path);
    }

    // Get the name of the feature to create
    String? featureName = argResults?['name'].toLowerCase();

    if (featureName == null || featureName.isEmpty) {
      throw UsageException('Please provide a name for the feature.', usage);
    }

    featureName = ReCase(featureName).camelCase;
    String snakeCase = ReCase(featureName).snakeCase;

    // Create the feature directory and its subdirectories
    Directory featureDirectory = Directory('${currentDirectory.path}/$featureName');
    featureDirectory.createSync();

    stdout.write('Creating subdirectories...\n');
    Directory uiDirectory = Directory('${featureDirectory.path}/ui');
    uiDirectory.createSync();

    Directory servicesDirectory = Directory('${featureDirectory.path}/services');
    servicesDirectory.createSync();

    Directory modelsDirectory = Directory('${featureDirectory.path}/models');
    modelsDirectory.createSync();

    currentDirectory = Directory('${featureDirectory.path}/ui');

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
        .replaceAll('HomeView', '${ReCase(featureName).pascalCase}View');

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
        .replaceAll('HomeView', '${ReCase(featureName).pascalCase}View');

    final viewModel = File('${currentDirectory.path}/${snakeCase}_view.dart');
    final viewModelBuilder = File('${currentDirectory.path}/${snakeCase}_view_model.dart');

    await viewModel.writeAsString(viewModelCode, mode: FileMode.write);
    await viewModelBuilder.writeAsString(viewModelBuilderCode, mode: FileMode.write);

    stdout.write('Created ${ReCase(featureName).titleCase} feature successfully.\n');
  }
}
