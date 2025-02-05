import 'package:evently/core/app_manger/app_provider.dart';
import 'package:evently/core/app_routes/app_route_name.dart';
import 'package:evently/core/constant/app_assets.dart';
import 'package:evently/firebase_manger/models/event_model.dart';
import 'package:evently/modules/events/manger/event_provider.dart';
import 'package:evently/modules/layout/manager/layout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventDetailsScreen extends StatefulWidget {
  EventDetailsScreen({super.key});

  @override
  State<EventDetailsScreen> createState() => _EventDetailesScreenState();
}

class _EventDetailesScreenState extends State<EventDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<LayoutProvider>(context, listen: false).getEventDetails();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var argument = ModalRoute.of(context)?.settings.arguments as EventModel;
    var eventProvider = Provider.of<EventProvider>(context);
    return Consumer<EventProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: const Text("Event Details"),
                backgroundColor: theme.scaffoldBackgroundColor,
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppRouteName.editEventScreen , arguments: argument);
                      },
                      icon: Image.asset(AppAssets.editIcon)),
                  IconButton(
                      onPressed: () {
                        provider.deleteEvent(context, argument.id!);
                      },
                      icon: Image.asset(AppAssets.deleteIcon))
                ],
              ),
              SliverList(
                  delegate: SliverChildListDelegate.fixed([
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.asset(argument.image),
                          ),
                          Text(
                            argument.title,
                            style: theme.textTheme.bodyLarge!
                                .copyWith(color: theme.primaryColor),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.r),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(16.r),
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
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: const Icon(
                                      Icons.calendar_month_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          DateFormat.MMMMEEEEd().format(
                                              DateTime.parse(
                                                  argument.eventDate)),
                                          style: theme.textTheme.bodySmall!
                                              .copyWith(
                                                  color: theme.primaryColor)),
                                      Text(
                                        argument.eventTime,
                                        style: theme.textTheme.bodySmall!
                                            .copyWith(
                                                fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.r),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(16.r),
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
                                      borderRadius: BorderRadius.circular(12.r),
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
                          ),
                          Container(
                            width: 361.w,
                            height: 361.h,
                            decoration: BoxDecoration(
                                border: Border.all(color: theme.primaryColor),
                                borderRadius: BorderRadius.circular(16.r),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/map_placeHolder.png"),
                                    fit: BoxFit.cover)),
                          ),
                          Text(
                            "Description",
                            style: theme.textTheme.bodySmall,
                          ),
                          Text(
                            argument.description,
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ]))
            ],
          ),
        );
      },
    );
  }
}
