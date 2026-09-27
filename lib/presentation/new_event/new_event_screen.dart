import 'package:evently/common/widgets/custom_main_button.dart';
import 'package:evently/common/widgets/custom_text_form_field.dart';
import 'package:evently/gen/assets.gen.dart';
import 'package:evently/presentation/new_event/widgets/categories_section.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewEventScreen extends StatefulWidget {
  const NewEventScreen({super.key});
  static const String routeName = "/newEventScreen";

  @override
  State<NewEventScreen> createState() => _NewEventScreenState();
}

class _NewEventScreenState extends State<NewEventScreen> {
  DateTime? eventSelectedDate;
  TimeOfDay? eventSelectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Event")),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          CategoriesSection(),
          CustomTextFormField(
            prefixIcon: Assets.icons.emailIcon,
            hintText: "Event Title",
            title: "Title",
          ),
          CustomTextFormField(title: "Description", maxLines: 5, hintText: "Event Description"),

          Row(
            spacing: 5,
            children: [
              Icon(Icons.date_range),
              Text(
                "Event Date",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16),
              ),
              Spacer(),
              TextButton(
                onPressed: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2040),
                    initialDate: eventSelectedDate,
                  );
                  if (selectedDate != null) {
                    setState(() {
                      eventSelectedDate = selectedDate;
                    });
                  }
                },
                child: Text(
                  eventSelectedDate != null
                      ? DateFormat.yMd().format(eventSelectedDate!)
                      : ("Choose Date").toString(),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          Row(
            spacing: 5,
            children: [
              Icon(Icons.watch_later_outlined),
              Text(
                "Event Time",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16),
              ),
              Spacer(),
              TextButton(
                onPressed: () async {
                  TimeOfDay? selectedTime = await showTimePicker(
                    context: context,
                    initialTime: eventSelectedTime ?? TimeOfDay.now(),
                  );
                  if (selectedTime != null) {
                    setState(() {
                      eventSelectedTime = selectedTime;
                    });
                  }
                },
                child: Text(
                  (eventSelectedTime?.format(context) ?? "Choose Time").toString(),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          CustomMainButton(isLoading: false, label: "Add Event", onPressed: () {}),
        ],
      ),
    );
  }
}
