      import 'package:code_on_the_rocks/code_on_the_rocks.dart';
      import 'package:flutter/material.dart';
      
      class FeedbackViewModelBuilder extends ViewModelBuilder<FeedbackViewModel> {
        const FeedbackViewModelBuilder({
          super.key,
          required super.builder,
        });
      
        @override
        State<StatefulWidget> createState() => FeedbackViewModel();
      }
      
      class FeedbackViewModel extends ViewModel<FeedbackViewModel> {
         static FeedbackViewModel of_(BuildContext context) => getModel<FeedbackViewModel>(context);
      }
      