      import 'package:code_on_the_rocks/code_on_the_rocks.dart';
      import 'package:flutter/material.dart';
      
      class NewFeedbackViewModelBuilder extends ViewModelBuilder<NewFeedbackViewModel> {
        const NewFeedbackViewModelBuilder({
          super.key,
          required super.builder,
        });
      
        @override
        State<StatefulWidget> createState() => NewFeedbackViewModel();
      }
      
      class NewFeedbackViewModel extends ViewModel<NewFeedbackViewModel> {
         static NewFeedbackViewModel of_(BuildContext context) => getModel<NewFeedbackViewModel>(context);
      }
      