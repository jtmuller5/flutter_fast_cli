      import 'package:code_on_the_rocks/code_on_the_rocks.dart';
      import 'package:flutter/material.dart';
      
      class LibraryViewModelBuilder extends ViewModelBuilder<LibraryViewModel> {
        const LibraryViewModelBuilder({
          super.key,
          required super.builder,
        });
      
        @override
        State<StatefulWidget> createState() => LibraryViewModel();
      }
      
      class LibraryViewModel extends ViewModel<LibraryViewModel> {
         static LibraryViewModel of_(BuildContext context) => getModel<LibraryViewModel>(context);
      }
      