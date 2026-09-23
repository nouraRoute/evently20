import 'package:evently/common/enums/categories_enum.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/presentation/home/widgets/event_card.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EventCard(
          eventModel: EventModel(
            categoriesEnum: CategoriesEnum.books,
            date: "kjfjgeljekhgj",
            description: "lkfnbfndml",
            isFav: true,
            title: "l;kewekn",
          ),
        ),
      ],
    );
  }
}
