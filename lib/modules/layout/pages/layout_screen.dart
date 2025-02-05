import 'package:evently/core/app_routes/app_route_name.dart';
import 'package:evently/modules/layout/manager/layout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => LayoutProvider()..getEvents(),
      child: Consumer<LayoutProvider>(
        builder: (context, provider, child) {
          return Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniCenterDocked,
              floatingActionButton: FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteName.createEventScreen);
                },
                tooltip: "Add Event",
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: provider.selectedIndex,
                  onTap: provider.changeScreen,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined),
                        label: "Home",
                        activeIcon: Icon(Icons.home_rounded)),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.location_on_outlined),
                        label: "Map",
                        activeIcon: Icon(Icons.location_on_rounded)),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite_border),
                        label: "Love",
                        activeIcon: Icon(Icons.favorite_rounded)),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_outlined),
                        label: "Profile",
                        activeIcon: Icon(Icons.person_rounded)),
                  ]),
              body: provider.screens[provider.selectedIndex]);
        },
      ),
    );
  }
}
