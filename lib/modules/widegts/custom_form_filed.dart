import 'package:evently/core/app_manger/app_provider.dart';
import 'package:evently/core/app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomFormFiled extends StatefulWidget {
  String? hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool isPassword = false;
  String? lableText;
  int? maxLines;
  String? initialValue;
  TextStyle? labelStyle;
  TextEditingController? controller = TextEditingController();
  String? Function(String?)? validator;
  void Function(String)? onChanged;

  CustomFormFiled(
      {super.key,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      required this.isPassword,
      this.labelStyle,
      this.lableText,
      this.controller,
      this.initialValue,
      this.validator,
      this.maxLines = 1,
      this.onChanged
      });

  @override
  State<CustomFormFiled> createState() => _CustomFormFiledState();
}

class _CustomFormFiledState extends State<CustomFormFiled> {
  bool isvisable = false;
  @override

  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var prov = Provider.of<AppProvider>(context);
    return TextFormField(
      onTapAlwaysCalled: false,
      onChanged: widget.onChanged,
      obscureText: widget.isPassword ? !isvisable : false,
      controller: widget.controller,
      validator: widget.validator,
      initialValue: widget.initialValue,
      obscuringCharacter: "*",
      maxLines: widget.maxLines,
      decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    isvisable = !isvisable;
                    setState(() {});
                  },
                  icon: Icon(isvisable
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded))
              : widget.suffixIcon,
          labelText: widget.lableText,
          labelStyle: widget.labelStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
                width: 1.2,
                color: prov.themeMode == ThemeMode.light
                    ? Colors.grey
                    : theme.primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
                width: 1.2,
                color: prov.themeMode == ThemeMode.light
                    ? Colors.grey
                    : theme.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
                width: 1.2,
                color: prov.themeMode == ThemeMode.light
                    ? Colors.grey
                    : theme.primaryColor),
          )),
    );
  }
}
