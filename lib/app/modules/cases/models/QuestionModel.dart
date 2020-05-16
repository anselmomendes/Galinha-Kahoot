import 'package:flutter/cupertino.dart';

class QuestionModel {
  final String title;
  final String description;
  final String imageUrl;

  QuestionModel(
      {@required this.title,
      @required this.description,
      @required this.imageUrl});
}
