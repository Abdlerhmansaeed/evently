import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/app_manger/app_provider.dart';
import 'core/app_routes/app_route_name.dart';
import 'core/app_routes/app_routes.dart';
import 'core/app_theme/app_theme.dart';
import 'firebase_options.dart';
import 'modules/events/manger/event_provider.dart';
import 'modules/layout/manager/layout_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  AppProvider appProvider = AppProvider();
  await appProvider.getTheme();

  runApp(MyApp(appProvider: appProvider));
}

class MyApp extends StatelessWidget {
  final AppProvider appProvider;

  const MyApp({super.key, required this.appProvider});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => appProvider), // Inject loaded provider
            ChangeNotifierProvider(create: (_) => LayoutProvider()),
            ChangeNotifierProvider(create: (_) => EventProvider()),
          ],
          child: Builder(builder: (context) {
            var provider = Provider.of<AppProvider>(context);

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: provider.themeMode, // Now it loads instantly
              routes: AppRoutes.routes,
              initialRoute: AppRouteName.splash,
            );
          }),
        );
      },
    );
  }
}
