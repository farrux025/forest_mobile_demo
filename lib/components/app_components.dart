import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/colors.dart';
import '../main.dart';
import 'app_text.dart';
import 'app_text_form_field.dart';

openSnackBar({required String message, Color? background}) {
  var context = MyApp.navigatorKey.currentState!.context;

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      margin: EdgeInsets.all(16.sp),
      behavior: SnackBarBehavior.floating,
      content: AppText(
          text: message, maxLines: 3, size: 14.0.sp, color: AppColor.white),
      padding: EdgeInsets.all(16.sp),
      backgroundColor: background ?? Colors.red.withOpacity(0.7)));
}

alert(
    {String? title,
    String? content,
    required String buttonText,
    required VoidCallback onPressed}) {
  return SimpleDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
    title: title != null
        ? AppText(
            text: title,
            color: AppColor.textColor,
            size: 16.sp,
            fontWeight: FontWeight.w600,
          )
        : const SizedBox(),
    children: [
      content != null
          ? AppText(
              text: content,
              size: 14.sp,
              color: AppColor.textColor,
              fontWeight: FontWeight.w400,
            )
          : const SizedBox(),
      SizedBox(height: 12.h),
      MaterialButton(
        onPressed: onPressed,
        minWidth: ScreenUtil().screenWidth,
        color: const Color(0xFF19794C),
        height: 36.h,
        elevation: 1,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        child: AppText(
          text: buttonText,
          color: AppColor.white,
          fontWeight: FontWeight.w500,
          size: 14.sp,
        ),
      )
    ],
  );
}

toast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.textColorSecondary,
      textColor: AppColor.white,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16.sp,
      toastLength: Toast.LENGTH_SHORT);
}

appButton(
    {required String text,
    required Color color,
    required VoidCallback onPressed}) {
  return MaterialButton(
    onPressed: onPressed,
    color: color,
    minWidth: ScreenUtil().screenWidth,
    height: 44.h,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
    child: AppText(
      text: text,
      size: 14.sp,
      color: AppColor.white,
      fontWeight: FontWeight.w600,
    ),
  );
}

titleEditText({required String title}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
    child: AppText(
      text: title,
      color: AppColor.textColorGreen,
      size: 11.sp,
      fontWeight: FontWeight.w600,
    ),
  );
}

editText(
    {TextEditingController? editingController,
    String? hint,
    TextInputType? inputType,
    int? maxLines,
    bool? readOnly,
    String? initialValue,
    FormFieldValidator<String>? validator}) {
  return Container(
      // height: (maxLines == 1) ? 32.h : null,
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: readOnly ?? false ? const Color(0x33000000) : const Color(0xfff5f5f5)),
      child: AppTextFormField(
        enableBorder: InputBorder.none,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
            horizontal: 10.w, vertical: maxLines == 1 ? 0 : 6.h),
        hint: hint,
        textSize: 13.sp,
        readOnly: readOnly,
        initialValue: initialValue,
        maxLines: maxLines,
        keyboardType: inputType,
        textEditingController: editingController,
        validator: validator,
      ));
}
