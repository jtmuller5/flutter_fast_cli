import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';

class SettingsViewModelBuilder extends ViewModelBuilder<SettingsViewModel> {
  const SettingsViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => SettingsViewModel();
}

class SettingsViewModel extends ViewModel<SettingsViewModel> {
  static SettingsViewModel of_(BuildContext context) => getModel<SettingsViewModel>(context);
}
