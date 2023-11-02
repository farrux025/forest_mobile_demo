import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class AppTextFormField extends StatelessWidget {
  String? labelText;
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
  bool? autofocus;
  InputBorder? border;
  InputBorder? enableBorder;
  EdgeInsetsGeometry? contentPadding;
  double? textSize;
  bool? readOnly;
  String? initialValue;

  AppTextFormField(
      {this.labelText,
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
      this.autofocus,
      this.border,
      this.enableBorder,
      this.contentPadding,
      this.textSize,
      this.readOnly,
      this.initialValue,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textEditingController,
      maxLines: maxLines,
      initialValue: initialValue,
      maxLength: maxLength,
      cursorWidth: 3,
      readOnly: readOnly ?? false,
      style: TextStyle(
          fontSize: textSize ?? 14.sp,
          color: AppColor.textColor,
          fontWeight: FontWeight.w500),
      inputFormatters: inputFormatter,
      keyboardType: keyboardType,
      autofocus: autofocus ?? false,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hint,
        contentPadding: contentPadding,
        hintStyle: TextStyle(
            fontSize: 13.sp,
            color: AppColor.textColorSecondary,
            fontWeight: FontWeight.w400),
        prefix: prefix,
        prefixIcon: getPrefixIcon(),
        suffixIcon: suffixIcon,
        focusColor: AppColor.white,
        border: border,
        enabledBorder: enableBorder,
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
