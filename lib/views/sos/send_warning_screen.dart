import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/components/app_text.dart';
import 'package:forest_mobile/components/app_text_form_field.dart';
import 'package:forest_mobile/constants/colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../components/functions.dart';

class SendWarningScreen extends StatefulWidget {
  final Point initialPoint;

  const SendWarningScreen({Key? key, required this.initialPoint})
      : super(key: key);

  @override
  State<SendWarningScreen> createState() => _SendWarningScreenState();
}

class _SendWarningScreenState extends State<SendWarningScreen> {
  final Completer<YandexMapController> _completer = Completer();

  final eventNameController = TextEditingController();
  final eventDescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> eventList = [
      _eventItem(event: "Yong'in"),
      // _eventItem(event: "Sel"),
    ];
    return Scaffold(
      backgroundColor: AppColor.backgroundColorDarker,
      appBar: AppBar(
        title: AppText(
            text: "Ogohlantirish yuborish",
            size: 16.sp,
            color: AppColor.textColor,
            fontWeight: FontWeight.w700),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.backgroundColorDarker,
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(title: "Hodisa turi"),
                Container(
                  width: ScreenUtil().screenWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColor.white),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                    items: eventList,
                    onChanged: (value) {},
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
                  )),
                ),
                SizedBox(height: 10.h),
                _title(title: "Hodisa nomi"),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColor.white),
                    child: AppTextFormField(
                      enableBorder: InputBorder.none,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                      hint: 'Hodisa nomi',
                      keyboardType: TextInputType.text,
                      textEditingController: eventNameController,
                      validator: (value) =>
                          AppTextValidator(eventNameController.text),
                    )),
                SizedBox(height: 10.h),
                _title(title: "To'liqroq tavsifi"),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColor.white),
                  child: AppTextFormField(
                      textEditingController: eventDescController,
                      maxLines: 4,
                      hint: "Hodisa haqida batafsilroq yozing",
                      border: InputBorder.none,
                      enableBorder: InputBorder.none,
                      validator: (value) =>
                          AppTextValidator(eventDescController.text),
                      keyboardType: TextInputType.text,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 6.h)),
                ),
                SizedBox(height: 10.h),
                _mapWidget()
              ],
            )),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: MaterialButton(
          onPressed: () {},
          height: 48.h,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
          color: AppColor.mainColor,
          child: AppText(
            text: "Yuborish",
            color: AppColor.white,
            size: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  _title({required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      child: AppText(
        text: title,
        color: AppColor.textColorGreen,
        size: 12.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  _eventItem({required String event}) {
    return DropdownMenuItem(
        child: AppText(text: event, size: 14.sp, color: AppColor.textColor));
  }

  _mapWidget() {
    return Container(
      height: 200.h,
      child: YandexMap(
        onMapCreated: _onMapCreated,
      ),
    );
  }

  void _onMapCreated(YandexMapController controller) {
    _completer.complete(controller);
    controller.moveCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: widget.initialPoint)));
    controller.moveCamera(CameraUpdate.zoomTo(10));
    controller.toggleUserLayer(visible: true);
  }

  Future<void> _zoomIn() async {
    YandexMapController yandexMapController = await _completer.future;
    yandexMapController.moveCamera(CameraUpdate.zoomIn());
    // setState(() {
    //   mapObjects.add(placeMarkMapObject);
    // });
  }

  Future<void> _zoomOut() async {
    YandexMapController yandexMapController = await _completer.future;
    yandexMapController.moveCamera(CameraUpdate.zoomOut());
  }

  Future<void> _goMyLocation() async {
    YandexMapController yandexMapController = await _completer.future;
    Geolocator.getCurrentPosition().then((pos) {
      yandexMapController.moveCamera(
          CameraUpdate.newCameraPosition(CameraPosition(
              target: Point(latitude: pos.latitude, longitude: pos.longitude))),
          animation:
              const MapAnimation(type: MapAnimationType.linear, duration: 1));
    });
  }
}
