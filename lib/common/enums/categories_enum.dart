import 'package:evently/gen/assets.gen.dart';
import 'package:flutter/material.dart';

enum CategoriesEnum {
  birthDays(title: "BirthDays"),
  books(title: "Books"),
  sports(title: "Sports"),
  gaming(title: "Gaming");

  final String title;

  const CategoriesEnum({required this.title});

  String get getImage {
    switch (this) {
      case CategoriesEnum.birthDays:
        return Assets.images.birthday.path;
      case CategoriesEnum.books:
        return Assets.images.bookClub.path;

      case CategoriesEnum.sports:
        return Assets.images.sports.path;

      case CategoriesEnum.gaming:
        return Assets.images.gamming.path;
    }
  }

  IconData get getIcon {
    switch (this) {
      case CategoriesEnum.birthDays:
        return Icons.cake_outlined;
      case CategoriesEnum.books:
        return Icons.menu_book;

      case CategoriesEnum.sports:
        return Icons.directions_bike;

      case CategoriesEnum.gaming:
        return Icons.sports_esports;
    }
  }
}

test() {
  CategoriesEnum enumvalue = CategoriesEnum.sports;
}
