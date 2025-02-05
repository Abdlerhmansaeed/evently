import 'package:evently/core/constant/app_assets.dart';
import 'package:evently/core/constant/category_data.dart';
import 'package:evently/firebase_manger/firebase_dataBase.dart';
import 'package:evently/modules/layout/manager/layout_provider.dart';
import 'package:evently/modules/widegts/event_card_widget.dart';
import 'package:evently/modules/widegts/tab_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => LayoutProvider(),
      child: Consumer<LayoutProvider>(
        builder: (context, prov, child) {
          return Scaffold(
              appBar: AppBar(
                toolbarHeight: 170.h,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.r),
                  bottomRight: Radius.circular(24.r),
                )),
                leadingWidth: double.infinity,
                leading: Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome Back ✨",
                                style: theme.textTheme.bodySmall!.copyWith(
                                    color: Colors.white, fontSize: 14.sp),
                              ),
                              Text(
                                FirebaseAuth
                                        .instance.currentUser?.displayName ??
                                    "User".toUpperCase(),
                                style: theme.textTheme.bodyLarge!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "Cairo , Egypt",
                                    style: theme.textTheme.bodyMedium!
                                        .copyWith(color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Image.asset(
                                AppAssets.sunIcon,
                              ),
                              Container(
                                margin: EdgeInsets.all(8.r),
                                padding: EdgeInsets.all(6.r),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: const Text(
                                  "en",
                                  style: TextStyle(),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      DefaultTabController(
                          length: CategoryData.categories.length,
                          child: TabBar(
                              isScrollable: true,
                              indicatorColor: Colors.transparent,
                              dividerColor: Colors.transparent,
                              onTap: prov.ontapselceted,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorPadding: EdgeInsets.all(0.r),
                              labelPadding: EdgeInsets.all(8.r),
                              tabAlignment: TabAlignment.start,
                              labelColor: theme.primaryColor,
                              unselectedLabelColor: Colors.white,
                              tabs: CategoryData.categories.map(
                                (e) {
                                  return Tab(
                                      child: TabWidget(
                                    categoryData: e,
                                    isSelected: prov.tapselectedIndex ==
                                        CategoryData.categories.indexOf(e),
                                  ));
                                },
                              ).toList())),
                    ],
                  ),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: StreamBuilder(
                      stream: FirebaseDatabase.getEvents(
                          CategoryData.categories[prov.tapselectedIndex].id),
                      builder: (context, snapshot) {
                        var data = snapshot.data?.docs ?? [];
                        return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 4.h),
                              child: EventCardWidget(
                                  eventModel: data[index].data()),
                            );
                          },
                        );
                      },
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
