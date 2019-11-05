import 'package:flutter/material.dart';

class DefaultAppBar {
  DefaultAppBar._();

  static appBar() {
    final _textColor = Colors.white;

    return AppBar(
      iconTheme: IconThemeData(
        color: _textColor,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(
        'Guilherme Vendramini',
        style: TextStyle(color: _textColor),
      ),
    );
  }
}
