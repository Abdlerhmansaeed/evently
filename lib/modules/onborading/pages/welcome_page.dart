import 'package:evently/core/app_routes/app_route_name.dart';
import 'package:evently/core/constant/app_assets.dart';
import 'package:evently/modules/onborading/data_model/onboradingdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                AppAssets.onboradingLogo,
                width: 160.w,
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: OnBoradingdata.onboradingdata.length - 1,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset(
                            OnBoradingdata.onboradingdata[index + 1].image,
                          ),
                        ),
                        Text(
                          OnBoradingdata.onboradingdata[index + 1].title,
                          style: theme.textTheme.bodyMedium!
                              .copyWith(color: theme.primaryColor),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          OnBoradingdata.onboradingdata[index + 1].discreption,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentPage != 0
                      ? IconButton.outlined(
                          color: theme.primaryColor,
                          style: ButtonStyle(
                              side: WidgetStateBorderSide.resolveWith(
                            (states) {
                              return BorderSide(
                                  color: theme.primaryColor, width: 1);
                            },
                          )),
                          onPressed: () {
                            _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linearToEaseOut);
                          },
                          icon: const Icon(Icons.arrow_back_rounded))
                      : const Spacer(),
                  const Spacer(),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: OnBoradingdata.onboradingdata.length - 1,
                    effect: ExpandingDotsEffect(
                        activeDotColor: theme.primaryColor,
                        radius: 16,
                        dotHeight: 8,
                        dotColor: Colors.black,
                        dotWidth: 8),
                  ),
                  const Spacer(),
                  IconButton.outlined(
                      color: theme.primaryColor,
                      style:
                          ButtonStyle(side: WidgetStateBorderSide.resolveWith(
                        (states) {
                          return BorderSide(
                              color: theme.primaryColor, width: 1);
                        },
                      )),
                      onPressed: () {
                        currentPage == OnBoradingdata.onboradingdata.length - 2
                            ? Navigator.pushReplacementNamed(
                                context, AppRouteName.login)
                            : _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linearToEaseOut);
                      },
                      icon: const Icon(Icons.arrow_forward_rounded))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
