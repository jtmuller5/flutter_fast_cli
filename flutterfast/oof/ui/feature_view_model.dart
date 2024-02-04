import 'package:simple_mvvm/simple_mvvm.dart';
import 'package:flutter/material.dart';

class OofViewModelBuilder extends ViewModelBuilder<OofViewModel> {
  const OofViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => OofViewModel();
}

class OofViewModel extends ViewModel<OofViewModel> {
   static OofViewModel of_(BuildContext context) => getModel<OofViewModel>(context);
}
      