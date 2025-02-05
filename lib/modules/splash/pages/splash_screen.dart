import 'package:animate_do/animate_do.dart';
import 'package:evently/core/app_manger/app_provider.dart';
import 'package:evently/core/app_routes/app_route_name.dart';
import 'package:evently/core/constant/app_assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          ElasticInDown(
              child: Center(child: Image.asset(AppAssets.eventlyLogo))),
          const Spacer(),
          FadeInUp(
              duration: Duration(seconds: 2),
              onFinish: (direction) {
                provider.getTheme();
                provider.getFirstTime().then(
                  (value) {
                    if (value) {
                      Navigator.pushReplacementNamed(
                          context, AppRouteName.onborading);
                    } else {
                      if (FirebaseAuth.instance.currentUser == null) {
                        Navigator.pushReplacementNamed(context, AppRouteName.login);
                      }else{
                        Navigator.pushReplacementNamed(context, AppRouteName.layoutScreen);
                      }
                    } 
                  },
                );
              },
              child: Image.asset(AppAssets.routeLogo))
        ],
      ),
    );
  }
}
