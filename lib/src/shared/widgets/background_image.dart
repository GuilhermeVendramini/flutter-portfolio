import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.overlay),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}