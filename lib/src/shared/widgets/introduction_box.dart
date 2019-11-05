import 'package:flutter/material.dart';

class IntroductionBox extends StatefulWidget {
  @override
  _IntroductionBoxState createState() => _IntroductionBoxState();
}

class _IntroductionBoxState extends State<IntroductionBox> {
  bool _startAnimation = false;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _startAnimation = true;
      });
    });

    return AnimatedContainer(
      alignment: _startAnimation ? Alignment.center : Alignment.bottomCenter,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: _startAnimation ? 1.0 : 0.0,
          child: Text(
            'Building Apps and Websites with excellence',
            style: TextStyle(
              fontSize: 38.0,
            ),
          ),
        ),
      ),
    );
  }
}
