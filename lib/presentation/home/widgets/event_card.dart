import 'package:evently/common/app_text_styles.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.eventModel});
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(eventModel.categoriesEnum.getImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "12\n",
                    style: AppTextStyles.styleS20W700(color: Theme.of(context).colorScheme.primary),
                  ),
                  TextSpan(text: "NOV"),
                ],
              ),
              style: AppTextStyles.styleS14W700(color: Theme.of(context).colorScheme.primary),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  eventModel.title,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 14),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    eventModel.isFav ? Icons.favorite : Icons.favorite_border_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
