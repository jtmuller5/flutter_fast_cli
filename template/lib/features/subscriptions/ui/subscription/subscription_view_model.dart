import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';
import 'package:template/app/services.dart';

class SubscriptionViewModelBuilder extends ViewModelBuilder<SubscriptionViewModel> {
  const SubscriptionViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => SubscriptionViewModel();
}

class SubscriptionViewModel extends ViewModel<SubscriptionViewModel> {

  @override
  void initState() {
    subscriptionService.fetchOfferings();
    super.initState();
  }

  static SubscriptionViewModel of_(BuildContext context) => getModel<SubscriptionViewModel>(context);
}
