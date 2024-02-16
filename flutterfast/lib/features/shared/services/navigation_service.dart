import 'package:flutterfast/app/router.dart';
import 'package:flutterfast/app/services.dart';
import 'package:injectable/injectable.dart';

@injectable
class NavigationService {
void navigateToHome() {
    router.pushAndPopUntil(
      const HomeRoute(),
      predicate: (route) => false,
    );
  }
}