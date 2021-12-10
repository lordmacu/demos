import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String subTitle;
  final String description;
  final String subDescription;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
    @required this.subTitle,
    @required this.subDescription,
  });
  factory Slide.fromJson(Map<String, dynamic> json) => Slide(
        imageUrl: json["image"],
        title: json["title"],
        subTitle: json["subTitle"],
        description: json["description"],
        subDescription: json["subDescription"],
      );
}
