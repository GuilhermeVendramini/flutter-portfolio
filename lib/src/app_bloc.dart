import 'package:flutter/foundation.dart';

class AppBloc extends ChangeNotifier {
  bool _startIntroAnimation = false;
  bool _startProfileAnimation = false;
  bool _showProfileBox = false;
}

class App extends AppBloc {
  bool get isIntroAnimationStarted {
    return _startIntroAnimation;
  }

  bool get isProfileAnimationStarted {
    return _startProfileAnimation;
  }

  bool get showProfileBox {
    return _showProfileBox;
  }
}

class AppProvider extends App {
  AppProvider() {
    startIntroAnimation();
    startProfileAnimation();
  }

  void startIntroAnimation() {
    Future.delayed(const Duration(seconds: 2), () {
      _startIntroAnimation = true;
      notifyListeners();
    });
  }

  void startProfileAnimation() {
    Future.delayed(const Duration(seconds: 4), () {
      _showProfileBox = true;
      notifyListeners();
    });

    Future.delayed(const Duration(seconds: 5), () {
      _startProfileAnimation = true;
      notifyListeners();
    });
  }
}
