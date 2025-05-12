import 'package:evently/core/app_manger/app_provider.dart';
import 'package:evently/core/constant/category_data.dart';
import 'package:evently/firebase_manger/models/event_model.dart';
import 'package:evently/modules/events/manger/event_provider.dart';
import 'package:evently/modules/widegts/Custom_button_widget.dart';
import 'package:evently/modules/widegts/custom_form_filed.dart';
import 'package:evently/modules/widegts/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/app_routes/app_route_name.dart';

class EditEventScreen extends StatelessWidget {
  const EditEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProv = Provider.of<AppProvider>(context);
    var eventsData = ModalRoute.of(context)?.settings.arguments as EventModel;
    var provider = Provider.of<EventProvider>(context, listen: false);
    provider.titleController.text = eventsData.title;
    provider.descriptionController.text = eventsData.description;
    return Consumer<EventProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: theme.primaryColor, size: 30),
            backgroundColor: Colors.transparent,
            title: Text(
              "Edit Event",
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: theme.primaryColor),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.r, vertical: 12.r),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(CategoryData
                          .createEventCategories[provider.tapselectedIndex]
                          .image),
                    ),
                  ),
                  DefaultTabController(
                      length: CategoryData.createEventCategories.length,
                      child: TabBar(
                          isScrollable: true,
                          indicatorColor: Colors.transparent,
                          dividerColor: Colors.transparent,
                          onTap: provider.ontapselceted,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorPadding: EdgeInsets.all(0.r),
                          labelPadding: EdgeInsets.all(8.r),
                          tabAlignment: TabAlignment.start,
                          labelColor: Colors.white,
                          unselectedLabelColor: theme.primaryColor,
                          tabs: CategoryData.createEventCategories.map(
                            (e) {
                              return Tab(
                                  child: TabWidget(
                                fillColor: theme.primaryColor,
                                borderColor: theme.primaryColor,
                                textColor: theme.primaryColor,
                                categoryData: e,
                                isSelected: provider.tapselectedIndex ==
                                    CategoryData.createEventCategories
                                        .indexOf(e),
                              ));
                            },
                          ).toList())),
                  Text(
                    "Title",
                    style: theme.textTheme.bodyMedium,
                  ),
                  CustomFormField(
                    prefixIcon: const Icon(Icons.edit_note),
                    hintText: "Event title",
                    labelStyle: theme.textTheme.bodySmall!,
                    isPassword: false,
                    controller: provider.titleController,
                  ),
                  Text(
                    "Description",
                    style: theme.textTheme.bodyMedium,
                  ),
                  CustomFormField(
                    isPassword: false,
                    hintText: "Event Description",
                    labelStyle: theme.textTheme.bodySmall!,
                    maxLines: 4,
                    controller: provider.descriptionController,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        color: appProv.themeMode == ThemeMode.dark
                            ? Colors.white
                            : null,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Event Date",
                        style: theme.textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            provider.selectedDate(context);
                          },
                          child: Text(
                            provider.selectedEventDate == null
                                ? DateTime.parse(eventsData.eventDate)
                                    .toLocal()
                                    .toString()
                                    .split(' ')[0]
                                : provider.selectedEventDate!
                                    .toLocal()
                                    .toString()
                                    .split(' ')[0],
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_time,
                          color: appProv.themeMode == ThemeMode.dark
                              ? Colors.white
                              : null),
                      SizedBox(
                        width: 5.w,
                      ),
                      const Text("Event Time"),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            provider.selectedTime(context);
                          },
                          child: Text(provider.selectedEventTime == null
                              ? eventsData.eventTime
                              : provider.selectedEventTime!
                                  .format(context)
                                  .toString())),
                    ],
                  ),
                  const Text("Location"),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: theme.primaryColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(8.r),
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.my_location_rounded,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "Choose Event Location",
                          style: theme.textTheme.bodySmall!
                              .copyWith(color: theme.primaryColor),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: theme.primaryColor,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
                    child: CustomButtonWidget(
                      title: "Update Event",
                      onPressed: () async {
                        final updatedEvent = EventModel(
                          id: eventsData.id,
                          title: provider.titleController.text,
                          description: provider.descriptionController.text,
                          image: eventsData.image,
                          categoryId: eventsData.categoryId,
                          eventDate: provider.selectedEventDate == null
                              ? eventsData.eventDate
                              : provider.selectedEventDate!.toString(),
                          eventTime: provider.selectedEventTime == null
                              ? eventsData.eventTime
                              : provider.selectedEventTime!.format(context),
                        userid: eventsData.userid,
                          isFav: eventsData.isFav,
                        );
                        print("Updated event data: ${updatedEvent..toString()}");
                        await provider.updateEvent(context, updatedEvent);
                        Navigator.pushReplacementNamed(context ,AppRouteName.layoutScreen);
                      },
                      backgroundColor: theme.primaryColor,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
