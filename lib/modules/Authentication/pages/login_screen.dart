import 'package:evently/core/app_routes/app_route_name.dart';
import 'package:evently/core/app_theme/app_colors.dart';
import 'package:evently/core/constant/app_assets.dart';
import 'package:evently/modules/Authentication/auth_manger/auth_provider.dart';
import 'package:evently/modules/widegts/Custom_button_widget.dart';
import 'package:evently/modules/widegts/custom_form_filed.dart';
import 'package:evently/modules/widegts/lanugage_changer_widget.dart';
import 'package:evently/modules/widegts/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: provider.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(child: Image.asset(AppAssets.eventlyLogo)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomFormFiled(
                          controller: provider.emailController,
                          hintText: "Enter Your Email",
                          lableText: "Email",
                          labelStyle: theme.textTheme.bodySmall,
                          validator: (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return "Please enter your email";
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(p0)) {
                              return "Please enter a valid email";
                            } else {
                              return null;
                            }
                          },
                          isPassword: false,
                          prefixIcon: const Icon(Icons.email_rounded),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomFormFiled(
                          controller: provider.passwordController,
                          hintText: "password",
                          lableText: "password",
                          labelStyle: theme.textTheme.bodySmall,
                          validator: (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return 'Please enter your password';
                            } else if (p0.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          },
                          isPassword: true,
                          prefixIcon: const Icon(Icons.lock_rounded),
                          suffixIcon: const Icon(Icons.visibility),
                        ),
                      ),
                      TextButtonWidget(
                        text: "Forget Password?",
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRouteName.forgetPassword);
                        },
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
                        child: CustomButtonWidget(
                          backgroundColor: theme.primaryColor,
                          style: theme.textTheme.bodyMedium!
                              .copyWith(color: AppColors.lightBg),
                          title: "Login",
                          onPressed: () {
                            provider.login(context);
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t Have Account ?",
                            style: theme.textTheme.bodySmall,
                          ),
                          TextButtonWidget(
                            text: "Create Account",
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRouteName.creatAccount);
                            },
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Divider(
                              color: theme.primaryColor,
                              indent: 30,
                              endIndent: 30,
                            ),
                          ),
                          Text(
                            'Or',
                            style: theme.textTheme.bodySmall!.copyWith(
                              color: theme.primaryColor,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: theme.primaryColor,
                              indent: 30,
                              endIndent: 30,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
                        child: CustomButtonWidget(
                            title: "Login With Google",
                            onPressed: () {
                              provider.singInWithGoogle(context);
                            },
                            icon: AppAssets.googelICon,
                            backgroundColor: theme.scaffoldBackgroundColor,
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: theme.primaryColor,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LanugageChangerWidget(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
