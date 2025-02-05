import 'package:evently/firebase_manger/firebase_dataBase.dart';
import 'package:evently/firebase_manger/models/event_model.dart';
import 'package:evently/modules/layout/pages/fav_screen.dart';
import 'package:evently/modules/layout/pages/home_screen.dart';
import 'package:evently/modules/layout/pages/map_screen.dart';
import 'package:evently/modules/layout/pages/profile_screen.dart';
import 'package:flutter/material.dart';

class LayoutProvider extends ChangeNotifier {
  int selectedIndex = 0;
  int tapselectedIndex = 0;

  void changeScreen(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> screens = [
    const HomeScreen(),
    const MapScreen(),
    const FavScreen(),
    const ProfileScreen()
  ];

  void ontapselceted(int index) {
    tapselectedIndex = index;
    notifyListeners();
  }

  setFav(EventModel data) {
    FirebaseDatabase.setFav(data);
    getFavEvents();
  }

  List<EventModel> events = [];
  List<EventModel> eventDetails = [];
  List<EventModel> favEvents = [];

  Future<void> getEvents() async {
    events.clear();
    var data = FirebaseDatabase.getEvents();
    data.asBroadcastStream(
      onListen: (subscription) {
        subscription.onData(
          (data) {
            for (var element in data.docs) {
              events.add(element.data());
            }
          },
        );
      },
    );

    notifyListeners();
  }

  Future<void> getFavEvents() async {
    favEvents.clear();
    var data = await FirebaseDatabase.getFav();
    for (var element in data) {
      favEvents.add(element.data());
    }
    notifyListeners();
  }

  Future<void> getEventDetails() async {
    eventDetails.clear();
    var data = await FirebaseDatabase.getEventDeatis();
    for (var element in data) {
      eventDetails.add(element.data());
    }
  }

  Future<void> search(String q) async {
    if (q.isEmpty) {
      getFavEvents();
      return;
    }
    var data = favEvents.where(
          (element) {
        return element.title.contains(q);
      },
    ).toList();
    favEvents = data;
    notifyListeners();
  }
}
