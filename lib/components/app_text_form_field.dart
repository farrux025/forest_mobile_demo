import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class AppTextFormField extends StatelessWidget {
  String labelText;
  FormFieldValidator<String>? validator;
  TextEditingController? textEditingController;
  Icon? prefixIcon;
  List<TextInputFormatter>? inputFormatter;
  Widget? prefix;
  Widget? suffixIcon;
  String? hint;
  int? maxLines;
  int? maxLength;
  TextInputType? keyboardType;
  ValueChanged<String>? onChanged;

  AppTextFormField(
      {required this.labelText,
      this.validator,
      this.textEditingController,
      this.prefixIcon,
      this.inputFormatter,
      this.prefix,
      this.suffixIcon,
      this.hint,
      this.maxLines,
      this.maxLength,
      this.keyboardType,
      this.onChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textEditingController,
      maxLines: maxLines,
      maxLength: maxLength,
      style: TextStyle(fontSize: 16.sp),
      inputFormatters: inputFormatter,
      keyboardType: keyboardType,
      autofocus: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        hintStyle:
            TextStyle(fontSize: 16.sp, color: AppColor.textColorSecondary),
        prefix: prefix,
        prefixIcon: getPrefixIcon(),
        suffixIcon: suffixIcon,
        focusColor: AppColor.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: AppColor.mainColor)),
        fillColor: Colors.black26,
      ),
    );
  }

  getPrefixIcon() {
    return prefixIcon != null
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: IconTheme(
              data: const IconThemeData(color: Colors.blueAccent),
              child: prefixIcon!,
            ),
          )
        : null;
  }
}
