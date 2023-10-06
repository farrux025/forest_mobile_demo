import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forest_mobile/components/app_text.dart';
import 'package:forest_mobile/components/app_text_form_field.dart';
import 'package:forest_mobile/constants/colors.dart';
import 'package:forest_mobile/constants/constants.dart';
import 'package:forest_mobile/constants/images.dart';

class UserExistScreen extends StatefulWidget {
  const UserExistScreen({super.key});

  @override
  State<UserExistScreen> createState() => _UserExistScreenState();
}

class _UserExistScreenState extends State<UserExistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
              flex: 1,
              child: SvgPicture.asset(
                AppImages.forestLogo,
                fit: BoxFit.cover,
              )),
          Flexible(
              flex: 1,
              child: Column(
                children: [
                  AppText(
                    text: 'Tizimga kirish',
                    size: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.textColor,
                  ),
                  SizedBox(height: 20.h),
                  AppTextFormField(
                    labelText: "Telefon raqami",
                    maxLines: 1,
                    keyboardType: TextInputType.phone,
                    prefix: AppText(
                        text: '+998 ', size: 16.sp, color: AppColor.textColor),
                    validator: (value) => AppTextValidator(value),
                    inputFormatter: [Mask.PHONE_NUMBER],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
