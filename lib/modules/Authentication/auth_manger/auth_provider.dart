import 'package:evently/core/app_routes/app_route_name.dart';
import 'package:evently/firebase_manger/firebase_auth.dart';
import 'package:evently/modules/widegts/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  // Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  // Form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Clear all controllers
  void clearControllers() {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    rePasswordController.clear();
  }

  // Handle account creation
  Future<void> createAccount(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    Loading.show(context);
    final result = await FirebaseAuthManger.createAccount(
      emailAddress: emailController.text.trim(),
      password: passwordController.text.trim(),
      name: nameController.text.trim(),
    );

    Loading.hide(context);
    
    if (result.isSuccess) {
      if (context.mounted) {
        clearControllers();
        Navigator.pushReplacementNamed(context, AppRouteName.layoutScreen);
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result.errorMessage!)),
        );
      }
    }
  }

  // Handle login
  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    Loading.show(context);
    final result = await FirebaseAuthManger.login(
      emailAddress: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    Loading.hide(context);
    
    if (result.isSuccess) {
      if (context.mounted) {
        clearControllers();
        debugPrint("User Name: ${FirebaseAuth.instance.currentUser?.displayName}");
        Navigator.pushReplacementNamed(context, AppRouteName.layoutScreen);
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result.errorMessage!)),
        );
      }
    }
  }

  // Handle Google sign-in
  Future<void> signInWithGoogle(BuildContext context) async {
    Loading.show(context);
    final result = await FirebaseAuthManger.signInWithGoogle();
    Loading.hide(context);

    if (result.isSuccess && context.mounted) {
      Navigator.pushReplacementNamed(context, AppRouteName.layoutScreen);
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result.errorMessage ?? 'Google sign-in failed')),
      );
    }
  }

  // Handle password reset
  Future<void> resetPassword(BuildContext context) async {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email address')),
      );
      return;
    }

    Loading.show(context);
    final result = await FirebaseAuthManger.resetPassword(
      emailController.text.trim(),
    );
    Loading.hide(context);

    if (result.isSuccess && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result.message ?? 'Password reset email sent')),
      );
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result.errorMessage ?? 'Failed to send reset email')),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }
}