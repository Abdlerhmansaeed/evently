import 'package:evently/core/app_routes/app_route_name.dart';
import 'package:evently/core/app_theme/app_colors.dart';
import 'package:evently/firebase_manger/firebase_auth.dart';
import 'package:evently/modules/widegts/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  UserCredential? user;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> createAccount(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      Loading.show(context);
      try {
        user = await FirebaseAuthManger.createAccount(
          emailAddress: emailController.text,
          password: passwordController.text,
          name: nameController.text,
        );

        Loading.hide(context);
        if (user != null) {
          Navigator.pushReplacementNamed(context, AppRouteName.layoutScreen);
        }
      } catch (e) {
        Loading.hide(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.toString()}")),
        );
      }
    }
  }



  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      Loading.show(context);
      try {
        user = await FirebaseAuthManger.login(
          emailAddress: emailController.text,
          password: passwordController.text,
        );

        Loading.hide(context);
        if (user != null) {
          print(
              "user Name is ${FirebaseAuth.instance.currentUser?.displayName}");
          Navigator.pushReplacementNamed(context, AppRouteName.layoutScreen);
        }
      } catch (e) {
        Loading.hide(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.toString()}")),
        );
      }
    }
  }

  Future<void> singInWithGoogle(BuildContext context) async {
    try {
      user = await FirebaseAuthManger.signInWithGoogle();

      if (user != null) {
        Navigator.pushReplacementNamed(context, AppRouteName.layoutScreen);
      }
    } catch (e) {
      print("Google Sign-In Error: $e");
    }
  }

  Future<void> resetPassword(BuildContext context) async {
    Loading.show(context);
    await FirebaseAuthManger.resetPassword(emailController.text);
    Loading.hide(context);
  }
}
