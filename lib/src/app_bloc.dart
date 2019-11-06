import 'package:flutter/foundation.dart';

class AppBloc extends ChangeNotifier {
  bool _startIntroAnimation = false;
  bool _startProfileAnimation = false;
}

class App extends AppBloc {
  bool get isIntroAnimationStarted {
    return _startIntroAnimation;
  }

  bool get isProfileAnimationStarted {
    return _startProfileAnimation;
  }
}

class AppProvider extends App {
  void startIntroAnimation() {
    Future.delayed(const Duration(seconds: 2), () {
      _startIntroAnimation = true;
      startProfileAnimation();
      notifyListeners();
    });
  }

  void startProfileAnimation() {
    Future.delayed(const Duration(seconds: 2), () {
      _startProfileAnimation = true;
      notifyListeners();
    });
  }
}
