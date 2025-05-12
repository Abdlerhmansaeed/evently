import 'package:evently/core/app_theme/app_colors.dart';
import 'package:evently/core/constant/app_assets.dart';
import 'package:evently/modules/Authentication/auth_manger/auth_provider.dart';
import 'package:evently/modules/widegts/Custom_button_widget.dart';
import 'package:evently/modules/widegts/custom_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, prov, child) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: AppColors.black),
              title: Text(
                "Forget Password",
                style: theme.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
              centerTitle: true,
              backgroundColor: theme.scaffoldBackgroundColor,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(AppAssets.forgetPassImage),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: CustomFormField(
                      controller: prov.emailController,
                      hintText: "Enter Your Email",
                      labelText: "Email",
                      labelStyle: theme.textTheme.bodySmall,
                      isPassword: false,
                      prefixIcon: const Icon(Icons.email_rounded),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                    child: CustomButtonWidget(
                        title: "Reset Password",
                        onPressed: () {
                          prov.resetPassword(context);
                        },
                        backgroundColor: theme.primaryColor,
                        style: theme.textTheme.bodyMedium!
                            .copyWith(color: AppColors.lightBg)),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
