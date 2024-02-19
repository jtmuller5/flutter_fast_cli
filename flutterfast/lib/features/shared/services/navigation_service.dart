import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';
import 'package:injectable/injectable.dart';

@injectable
class NavigationService {
  void navigateToHome() {
    bool onboarded = sharedPrefs.getBool('onboarded_${authenticationService.id}') ?? false;

    if (onboarded) {
      router.pushAndPopUntil(
        const HomeRoute(),
        predicate: (route) => false,
      );
    } else {
      navigateToOnboarding();
    }
  }

  void navigateToSignIn(){
    router.pushAndPopUntil(
       SignInRoute(),
      predicate: (route) => false,
    );
  
  }

  void navigateToOnboarding() {
    router.pushAndPopUntil(
      const OnboardingRoute(),
      predicate: (route) => false,
    );
  }
}
