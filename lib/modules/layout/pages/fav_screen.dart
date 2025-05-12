import 'package:evently/modules/layout/manager/layout_provider.dart';
import 'package:evently/modules/widegts/custom_form_filed.dart';
import 'package:evently/modules/widegts/event_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<LayoutProvider>(context, listen: false).getFavEvents();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<LayoutProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.r),
              child: CustomFormField(
                isPassword: false,
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: theme.primaryColor,
                ),
                labelStyle:
                    TextStyle(fontSize: 16.sp, color: theme.primaryColor),
                labelText: "Search for Event",
                onChanged: (searchValue) {
                  provider.search(searchValue);
                },
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: provider.favEvents.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: EventCardWidget(eventModel: provider.favEvents[index]),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
