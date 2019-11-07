import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final _textStyle = TextStyle(
    color: Colors.white,
  );

  static final ThemeData themeData = ThemeData(
    fontFamily: 'FuturaPT',
    primarySwatch: Colors.grey,
    canvasColor: Colors.black.withOpacity(0.9),
    hoverColor: Colors.grey.withOpacity(0.4),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    textTheme: TextTheme(
      headline: _textStyle,
      subtitle: _textStyle,
      title: _textStyle,
      body1: _textStyle,
      body2: _textStyle,
      subhead: _textStyle,
    ),
  );
}