import 'package:evently/core/app_manger/app_provider.dart';
import 'package:evently/core/app_routes/app_route_name.dart';
import 'package:evently/core/app_theme/app_colors.dart';
import 'package:evently/firebase_manger/models/event_model.dart';
import 'package:evently/modules/layout/manager/layout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventCardWidget extends StatelessWidget {
  final EventModel eventModel;
  const EventCardWidget({super.key, required this.eventModel});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LayoutProvider>(context);
    var appProvider = Provider.of<AppProvider>(context);
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouteName.eventDetailesScreen,
            arguments: eventModel);
      },
      child: Container(
        width: 361.w,
        height: 204.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: appProvider.themeMode == ThemeMode.dark? Border.all(color: theme.primaryColor, width: 1.5):null,
            image: DecorationImage(
                image: AssetImage(eventModel.image), fit: BoxFit.cover)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Container(
                    decoration: BoxDecoration(
                        color: appProvider.themeMode == ThemeMode.light
                            ? AppColors.lightBg
                            : AppColors.black,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.r, vertical: 8.r),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat.d()
                                .format(DateTime.parse(eventModel.eventDate)),
                            style: theme.textTheme.bodySmall!
                                .copyWith(color: theme.primaryColor),
                          ),
                          Text(
                            DateFormat.MMM()
                                .format(DateTime.parse(eventModel.eventDate)),
                            style: theme.textTheme.bodySmall!
                                .copyWith(color: theme.primaryColor),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.all(8.r),
              margin: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                  color: appProvider.themeMode == ThemeMode.light
                      ? AppColors.lightBg
                      : AppColors.black,
                  borderRadius: BorderRadius.circular(8.r)),
              child: Row(
                children: [
                  SizedBox(
                    width: 200.h,
                    child: Text(
                      eventModel.title,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        provider.setFav(eventModel);
                      },
                      child: Icon(
                        eventModel.isFav
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                        color: theme.primaryColor,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
