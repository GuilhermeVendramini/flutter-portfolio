import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_bloc.dart';

class IntroductionBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<AppProvider>(context);
    final _isAnimationStarted = _bloc.isIntroAnimationStarted;
    return AnimatedOpacity(
      duration: Duration(seconds: 2),
      opacity: _isAnimationStarted ? 1.0 : 0.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          'Building Apps and Websites with excellence',
          style: TextStyle(
            fontSize: 40.0,
          ),
        ),
      ),
    );
  }
}
