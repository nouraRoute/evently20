import 'package:evently/common/enums/categories_enum.dart';

class EventModel {
  String title;
  String description;
  String date;
  CategoriesEnum categoriesEnum;
  bool isFav;
  String? id;
  EventModel({
    required this.categoriesEnum,
    required this.date,
    required this.description,
    this.id,
    required this.isFav,
    required this.title,
  });
}
