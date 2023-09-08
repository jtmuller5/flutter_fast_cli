import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';
import 'package:flutterfast/features/home/ui/onboarding/widgets/page_one.dart';
import 'package:flutterfast/features/home/ui/onboarding/widgets/page_three.dart';
import 'package:flutterfast/features/home/ui/onboarding/widgets/page_two.dart';
import 'onboarding_view_model.dart';

@RoutePage()
class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnboardingViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
          body: PageView(controller: model.pageController, children: const [
            PageOne(),
            PageTwo(),
            PageThree(),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (model.pageController.page == 2) {
                router.replace(const HomeRoute());
              } else if (model.pageController.page == 1) {
                model.pageController.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
              } else if (model.pageController.page == 0) {
                model.pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
              }
            },
            child: const Icon(Icons.arrow_forward),
          ),
        );
      },
    );
  }
}
