import 'package:evently/core/constant/category_data.dart';
import 'package:evently/firebase_manger/firebase_dataBase.dart';
import 'package:evently/firebase_manger/models/event_model.dart';
import 'package:evently/modules/widegts/loading.dart';
import 'package:flutter/material.dart';

import '../../../core/app_routes/app_route_name.dart';

class EventProvider extends ChangeNotifier {
  DateTime? selectedEventDate;
  TimeOfDay? selectedEventTime;
  int tapselectedIndex = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late CategoryData data;
  late EventModel eventModel;





  void ontapselceted(int index) {
    tapselectedIndex = index;
    notifyListeners();
  }

  void selectedDate(BuildContext context) {
    showDatePicker(
      context: context,
      currentDate: selectedEventDate,
      initialDate: selectedEventDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 5000),
      ),
    ).then(
          (value) {
        selectedEventDate = value;
        notifyListeners();
      },
    );
  }

  void selectedTime(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then(
          (value) {
        selectedEventTime = value;
        notifyListeners();
      },
    );
  }

  Future<void> addEvent(BuildContext context) async {
    Loading.show(context);
    FirebaseDatabase.addEvent(EventModel(
        categoryId: CategoryData.createEventCategories[tapselectedIndex].id,
        description: descriptionController.text,
        title: titleController.text,
        image: CategoryData.createEventCategories[tapselectedIndex].image,
        eventDate: selectedEventDate.toString(),
        eventTime: selectedEventTime!.format(context)));
    Loading.hide(context);
    Navigator.pop(context);
  }

  Future<void> deleteEvent(BuildContext context, String eventId) async {
    Loading.show(context);
    await FirebaseDatabase.deleteEvent(eventId);
    Loading.hide(context);
    Navigator.pop(context);
  }

  Future<void> updateEvent(BuildContext context, EventModel event) async {
    Loading.show(context);
    try {
      await FirebaseDatabase.updateEvent(event);
      print("Event updated successfully in provider");
    } catch (e) {
      print("Error updating event in provider: ${e.toString()}");
    } finally {
      Loading.hide(context);
    }
  }
}
