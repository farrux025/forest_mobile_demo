import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText extends StatelessWidget {
  String text;
  double? size;
  Color? color;
  FontWeight? fontWeight;
  String? fontFamily;
  int? maxLines;
  TextAlign? textAlign;
  FontStyle? fontStyle;
  TextDecoration? textDecoration;
  Color? decorationColor;

  AppText(
      {super.key,
      required this.text,
      this.size,
      this.color,
      this.fontWeight,
      this.fontFamily,
      this.maxLines,
      this.textAlign,
      this.fontStyle,
      this.decorationColor,
      this.textDecoration});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: color,
            fontSize: size ?? 14.sp,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontFamily: fontFamily,
            fontStyle: fontStyle,
            decoration: textDecoration,
            decorationColor: decorationColor),
        maxLines: maxLines,
        textAlign: textAlign);
  }
}
