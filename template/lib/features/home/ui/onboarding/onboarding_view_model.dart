import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';

class OnboardingViewModelBuilder extends ViewModelBuilder<OnboardingViewModel> {
  const OnboardingViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => OnboardingViewModel();
}

class OnboardingViewModel extends ViewModel<OnboardingViewModel> {
  static OnboardingViewModel of_(BuildContext context) => getModel<OnboardingViewModel>(context);
}
