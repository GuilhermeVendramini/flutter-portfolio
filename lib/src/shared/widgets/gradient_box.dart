import 'package:flutter/material.dart';

class GradientBox {
  GradientBox._();

  static boxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.1, 0.5, 0.7, 0.9],
        colors: [
          Colors.indigo[900].withOpacity(0.8),
          Colors.indigo[800].withOpacity(0.8),
          Colors.indigo[600].withOpacity(0.8),
          Colors.indigo[800].withOpacity(0.8),
        ],
      ),
    );
  }
}
