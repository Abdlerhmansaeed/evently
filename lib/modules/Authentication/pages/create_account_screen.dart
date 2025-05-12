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

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

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
                "Register",
                style: theme.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
              centerTitle: true,
              backgroundColor: theme.scaffoldBackgroundColor,
            ),
            body: Form(
              key: prov.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(AppAssets.eventlyLogo),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.r, horizontal: 8.r),
                      child: CustomFormField(
                        controller: prov.nameController,
                        hintText: "Enter Your Name",
                        labelText: "Name",
                        labelStyle: theme.textTheme.bodySmall,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Please enter your name';
                          } else {
                            return null;
                          }
                        },
                        isPassword: false,
                        prefixIcon: const Icon(Icons.person_2_rounded),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.r, horizontal: 8.r),
                      child: CustomFormField(
                        controller: prov.emailController,
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
                        hintText: "Enter Your Email",
                        labelText: "Email",
                        labelStyle: theme.textTheme.bodySmall,
                        isPassword: false,
                        prefixIcon: const Icon(Icons.email_rounded),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.r, horizontal: 8.r),
                      child: CustomFormField(
                        controller: prov.passwordController,
                        hintText: "Enter Your Password",
                        labelText: "Password",
                        labelStyle: theme.textTheme.bodySmall,
                        isPassword: true,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Please enter your password';
                          } else if (p0.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        },
                        prefixIcon: const Icon(
                          Icons.lock_rounded,
                        ),
                        suffixIcon: const Icon(Icons.visibility),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.r, horizontal: 8.r),
                      child: CustomFormField(
                        controller: prov.rePasswordController,
                        hintText: "Re Password",
                        labelText: "Re Password",
                        labelStyle: theme.textTheme.bodySmall,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Please enter your password';
                          } else if (p0.length < 8) {
                            return 'Password must be at least 8 characters long';
                          } else if (p0 != prov.passwordController.text) {
                            return 'Password does not match';
                          } else {
                            return null;
                          }
                        },
                        isPassword: true,
                        prefixIcon: const Icon(
                          Icons.lock_rounded,
                        ),
                        suffixIcon: const Icon(Icons.visibility),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
                      child: CustomButtonWidget(
                          title: "Create Account",
                          onPressed: () {
                            prov.createAccount(context);
                          },
                          backgroundColor: theme.primaryColor,
                          style: theme.textTheme.bodyMedium!
                              .copyWith(color: AppColors.lightBg)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: theme.textTheme.bodySmall,
                        ),
                        TextButtonWidget(
                          text: "Login",
                          onPressed: () {
                            Navigator.pushNamed(context, AppRouteName.login);
                          },
                        )
                      ],
                    ),
                    const LanugageChangerWidget()
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
