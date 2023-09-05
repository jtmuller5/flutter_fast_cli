      import 'package:code_on_the_rocks/code_on_the_rocks.dart';
      import 'package:flutter/material.dart';
      import 'onboarding_view_model.dart';
      
      class OnboardingView extends StatelessWidget {
        const OnboardingView({Key? key}) : super(key: key);
      
        @override
        Widget build(BuildContext context) {
          return OnboardingViewModelBuilder(
              builder: (context, model) {
                return Scaffold(
                  body: Center(
                    child: Text('Home'),
                  )
                );
              },
            );
        }
      }
      