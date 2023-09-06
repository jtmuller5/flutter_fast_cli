import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';
import 'package:template/app/services.dart';

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
