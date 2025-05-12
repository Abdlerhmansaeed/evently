import 'package:evently/core/app_manger/app_provider.dart';
import 'package:evently/core/constant/category_data.dart';
import 'package:evently/modules/events/manger/event_provider.dart';
import 'package:evently/modules/widegts/Custom_button_widget.dart';
import 'package:evently/modules/widegts/custom_form_filed.dart';
import 'package:evently/modules/widegts/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProv = Provider.of<AppProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: Consumer<EventProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: theme.primaryColor, size: 30),
              backgroundColor: Colors.transparent,
              title: Text(
                "Create Event",
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
                        child: Image.asset(
                          CategoryData
                              .createEventCategories[provider.tapselectedIndex].image,
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),),
                DefaultTabController(
                    length: CategoryData.createEventCategories.length,
                    child: TabBar(
                      isScrollable: true,
                      onTap: provider.ontapselceted,
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      indicator:
                      const BoxDecoration(color: Colors.transparent),
                      // indicatorWeight: 1,
                      // indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      labelPadding: const EdgeInsets.all(8),
                      tabAlignment: TabAlignment.start,
                      labelColor: Colors.white,
                      unselectedLabelColor: theme.primaryColor,
                      tabs: CategoryData.createEventCategories.map(
                            (e) {
                          return Tab(
                            child: TabWidget(
                                categoryData: e,
                                 borderColor: theme.primaryColor,
                                fillColor: provider.tapselectedIndex ==
                                    CategoryData.createEventCategories
                                        .indexOf(e) ? theme.primaryColor : null,
                                textColor: provider.tapselectedIndex ==
                                    CategoryData.createEventCategories
                                        .indexOf(e) ? Colors.white : theme.primaryColor,
                                isSelected: provider.tapselectedIndex ==
                                    CategoryData.createEventCategories
                                        .indexOf(e)),
                          );
                        },
                      ).toList(),)),
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
                      controller: provider.descriptionController,
                      maxLines: 4,
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
                                  ? "Selected Date"
                                  : DateFormat.yMd()
                                  .format(provider.selectedEventDate!),
                              style: theme.textTheme.bodySmall!
                                  .copyWith(color: theme.primaryColor),
                            )),
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
                                ? "Selected Time"
                                : provider.selectedEventTime!.format(context),
                              style: theme.textTheme.bodySmall!
                                  .copyWith(color: theme.primaryColor),
                            )),
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
                        title: "Add Event",
                        onPressed: () {
                          provider.addEvent(context);
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
      ),
    );
  }
}
