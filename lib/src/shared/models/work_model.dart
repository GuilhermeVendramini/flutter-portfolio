import 'package:flutter/foundation.dart';

class WorkModel {
  final String image;
  final String title;
  final String link;
  final String description;
  final String category;

  WorkModel({
    @required this.image,
    @required this.title,
    @required this.link,
    @required this.description,
    @required this.category,
  });
}
