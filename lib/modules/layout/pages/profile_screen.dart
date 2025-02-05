import 'package:evently/core/app_manger/app_provider.dart';
import 'package:evently/core/app_routes/app_route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var prov = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        leadingWidth: double.infinity,
        toolbarHeight: 150.h,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64.r))),
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 16.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(360.r),
                  bottomRight: Radius.circular(360.r),
                  topRight: Radius.circular(360.r),
                ),
                child: Image.asset(
                  "assets/images/route_pic.png",
                  width: 125,
                  height: 125,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FirebaseAuth.instance.currentUser?.displayName ?? "",
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                  Text(
                    FirebaseAuth.instance.currentUser?.email ?? "",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: Colors.white, fontSize: 18.sp),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Text(
              "Language",
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Container(
            padding: EdgeInsets.all(4.r),
            margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
            decoration: BoxDecoration(
                border: Border.all(color: theme.primaryColor),
                borderRadius: BorderRadius.circular(16.r)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                style: TextStyle(
                  color: theme.primaryColor,
                ),
                icon: Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 40,
                  color: theme.primaryColor,
                ),
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                      value: 'en',
                      child: Text(
                        'English',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.primaryColor,
                        ),
                      )),
                  DropdownMenuItem(
                      value: 'ar',
                      child: Text(
                        'Arabic',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.primaryColor,
                        ),
                      )),
                ],
                onChanged: (value) {},
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Text(
              "Theme",
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Container(
            padding: EdgeInsets.all(4.r),
            margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
            decoration: BoxDecoration(
                border: Border.all(color: theme.primaryColor),
                borderRadius: BorderRadius.circular(16.r)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<ThemeMode>(
                isExpanded: true,
                icon: Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 40,
                  color: theme.primaryColor,
                ),
                value: prov.themeMode,
                items: [
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text(
                      'Light Theme',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text(
                      'Dark Theme',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ],
                onChanged: (value) {
                  prov.changeTheme(value);
                  prov.saveTheme();
                },
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.r, horizontal: 16.r),
            child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r))),
                  backgroundColor:
                      const WidgetStatePropertyAll(Color(0xffFF5659)),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, AppRouteName.login);
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.r),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Logout",
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
