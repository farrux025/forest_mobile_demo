import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class AppPasswordFormField extends StatefulWidget {
  String labelText;
  FormFieldValidator<String>? validator;
  TextEditingController? controller;
  Icon? prefixIcon;
  List<TextInputFormatter>? inputFormatter;
  ValueChanged<String>? onChanged;

  AppPasswordFormField({
    Key? key,
    required this.labelText,
    this.validator,
    this.controller,
    this.prefixIcon,
    this.inputFormatter,
    this.onChanged,
  }) : super(key: key);

  @override
  AppPasswordFormFieldState createState() => AppPasswordFormFieldState();
}

class AppPasswordFormFieldState extends State<AppPasswordFormField> {
  var focusNode = FocusNode();
  var obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      validator: widget.validator,
      controller: widget.controller,
      autofocus: true,
      inputFormatters: widget.inputFormatter,
      obscureText: obscure,
      style: TextStyle(fontSize: 16.sp),
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
          labelText: widget.labelText,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: AppColor.mainColor)),
          prefixIcon: getPrefixIcon(),
          suffixIcon: suffixIcon(),
          fillColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: AppColor.textColor),
          errorMaxLines: 2,
          errorStyle: const TextStyle(color: AppColor.errorColor)),
    );
  }

  Widget? getPrefixIcon() {
    return widget.prefixIcon != null
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.r),
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).primaryColor),
              child: widget.prefixIcon!,
            ),
          )
        : null;
  }

  Widget? suffixIcon() {
    return IconButton(
      onPressed: () {
        setState(() {
          obscure = !obscure;
        });
      },
      icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
    );
  }
}
