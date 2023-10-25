import 'dart:async';
import 'dart:developer';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forest_mobile/components/app_components.dart';
import 'package:forest_mobile/components/app_text.dart';
import 'package:forest_mobile/components/app_text_form_field.dart';
import 'package:forest_mobile/constants/colors.dart';
import 'package:forest_mobile/constants/variables.dart';
import 'package:forest_mobile/cubit/warning_message/event_type_cubit.dart';
import 'package:forest_mobile/cubit/warning_message/warning_message_cubit.dart';
import 'package:forest_mobile/models/image/UploadImageResponse.dart';
import 'package:forest_mobile/models/warning_message/EventTypeRes.dart';
import 'package:forest_mobile/service/image_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../components/functions.dart';
import '../../constants/images.dart';

class SendWarningScreen extends StatefulWidget {
  const SendWarningScreen({Key? key}) : super(key: key);

  @override
  State<SendWarningScreen> createState() => _SendWarningScreenState();
}

class _SendWarningScreenState extends State<SendWarningScreen> {
  final Completer<YandexMapController> _completer = Completer();

  Point initialPoint = const Point(latitude: 41.222, longitude: 69.222);
  Point target = const Point(latitude: 41.222, longitude: 69.222);

  EventTypeRes dropdownValue = EventTypeRes(name: "Tanlang");

  @override
  void initState() {
    super.initState();
    Geolocator.getCurrentPosition().then((pos) {
      initialPoint = Point(latitude: pos.latitude, longitude: pos.longitude);
    });
    target = initialPoint;
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<EventTypeRes>> eventList = [
      _eventItem(event: EventTypeRes(name: "Suv toshqini")),
      _eventItem(event: EventTypeRes(name: "Sel")),
    ];
    return BlocProvider(
      create: (BuildContext context) => WarningMessageCubit(),
      child: BlocListener<WarningMessageCubit, WarningMessageState>(
        listener: (BuildContext context, state) {
          if (state is WarningMessageLoading) {
            MyDialog.openLoading();
          }
          if (state is WarningMessageError) {
            closeKeyboard();
            MyDialog.closeLoading();
            openSnackBar(message: state.error);
          }
          if (state is WarningMessageLoaded) {
            closeKeyboard();
            MyDialog.closeLoading();
            openSnackBar(message: state.response.title ?? '');
          }
        },
        child: BlocBuilder<WarningMessageCubit, WarningMessageState>(
          builder: (context, state) {
            var readWM = context.read<WarningMessageCubit>();
            var watchWM = context.watch<WarningMessageCubit>();
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
                surfaceTintColor: AppColor.backgroundColorDarker,
                backgroundColor: AppColor.backgroundColorDarker,
              ),
              body: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _title(title: "Hodisa turi"),
                        BlocProvider(
                          create: (BuildContext context) => EventTypeCubit(),
                          child: BlocListener<EventTypeCubit, EventTypeState>(
                            listener: (BuildContext context, state) {},
                            child: BlocBuilder<EventTypeCubit, EventTypeState>(
                              builder: (context, state) {
                                var read = context.read<EventTypeCubit>();
                                return Container(
                                  width: ScreenUtil().screenWidth - 50.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: AppColor.white),
                                  child: DropdownButtonFormField<EventTypeRes>(
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Tanlang"),
                                    // value: dropdownValue,
                                    items: eventList,
                                    onChanged: (EventTypeRes? value) =>
                                        setState(() => dropdownValue = value!),
                                    onTap: () => read.getEventList(),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 0),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        _title(title: "Hodisa nomi"),
                        Form(
                          key: watchWM.keyTitle,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: AppColor.white),
                              child: AppTextFormField(
                                enableBorder: InputBorder.none,
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10.w),
                                hint: 'Hodisa nomi',
                                keyboardType: TextInputType.text,
                                textEditingController: watchWM.titleController,
                                validator: (value) => AppTextValidator(
                                    watchWM.titleController.text.trim(),
                                    required: true),
                              )),
                        ),
                        SizedBox(height: 10.h),
                        _title(title: "To'liqroq tavsifi"),
                        Form(
                          key: watchWM.keyDesc,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColor.white),
                            child: AppTextFormField(
                                textEditingController: watchWM.descController,
                                maxLines: 4,
                                hint: "Hodisa haqida batafsilroq yozing",
                                border: InputBorder.none,
                                enableBorder: InputBorder.none,
                                validator: (value) => AppTextValidator(
                                    watchWM.descController.text.trim(),
                                    required: true),
                                keyboardType: TextInputType.text,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 6.h)),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        _title(title: "Hodisa suratini yuklash"),
                        _imagesWidget(),
                        SizedBox(height: 10.h),
                        _mapWidget()
                      ],
                    )),
              ),
              bottomNavigationBar: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: MaterialButton(
                  onPressed: () {
                    readWM.createWarningMessage();
                  },
                  height: 48.h,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r)),
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
          },
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

  _eventItem({required EventTypeRes event}) {
    return DropdownMenuItem<EventTypeRes>(
        value: event,
        child: AppText(
            text: event.name ?? '', size: 14.sp, color: AppColor.textColor));
  }

  List<UploadImageResponse> images = [];

  _imagesWidget() {
    return ValueListenableBuilder(
      valueListenable: MyValueNotifiers.uploadImageNotifier,
      builder: (context, value, child) {
        return SizedBox(
          height: 90.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            primary: false,
            itemBuilder: (context, index) {
              if (images.isEmpty) {
                return MaterialButton(
                  height: 80.h,
                  minWidth: 80.h,
                  color: AppColor.white,
                  elevation: 0.5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  onPressed: () {
                    _pickImage();
                    // ImageService.pickImage(imageSource: ImageSource.camera);
                    // if (value == MyValueNotifiers.uploadImageLoading) {
                    //   MyDialog.openLoading();
                    // }
                    // if (value == MyValueNotifiers.uploadImageLoaded) {
                    //   MyDialog.closeLoading();
                    // }
                    // if (value == MyValueNotifiers.uploadImageError) {
                    //   MyDialog.closeLoading();
                    // }
                  },
                  child: Icon(Icons.add, color: AppColor.black, size: 36.sp),
                );
              } else {
                return ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(images[index].file ?? '',
                        height: 80.h, width: 80.w, fit: BoxFit.cover));
              }
            },
            padding: EdgeInsets.only(right: 10.w, top: 8.h, bottom: 10.h),
            itemCount: images.length + 1,
          ),
        );
      },
    );
  }

  _mapWidget() {
    return ExpansionTileCard(
      title: AppText(
        text: "Xaritadan joylashuvni tanlang",
        color: AppColor.textColorGreen,
        size: 12.sp,
        fontWeight: FontWeight.w600,
      ),
      onExpansionChanged: (value) async {
        log("Value: $value");
        if (value) {
          YandexMapController future = await _completer.future;
          _onMapCreated(future);
          setState(() {});
        }
      },
      initiallyExpanded: true,
      initialElevation: 1,
      children: [
        Container(
          decoration: const BoxDecoration(
              border: Border.symmetric(horizontal: BorderSide(width: 0.5))),
          height: 200.h,
          child: Stack(
            children: [
              YandexMap(
                onMapCreated: _onMapCreated,
                onMapTap: (point) {
                  setState(() {
                    target = point;
                    log("Point: $point");
                  });
                },
                onCameraPositionChanged: (cameraPosition, reason, finished) {
                  // if (finished) {
                  //   setState(() {
                  //     target = cameraPosition.target;
                  //     log("Target point: $target");
                  //   });
                  // }
                },
                mapObjects: [
                  PlacemarkMapObject(
                      mapId: const MapObjectId("target"),
                      point: target,
                      icon: PlacemarkIcon.single(PlacemarkIconStyle(
                          image: BitmapDescriptor.fromAssetImage(
                              AppImages.locationIcon),
                          scale: 0.2,
                          anchor: Offset.fromDirection(1, 1))))
                ],
              ),
              Positioned(
                  right: 6.w,
                  bottom: 20.h,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 24.h,
                        width: 24.h,
                        child: FloatingActionButton(
                          onPressed: () => _zoomIn(),
                          backgroundColor: AppColor.black.withOpacity(0.3),
                          heroTag: 'zoom_in',
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r)),
                          child: Icon(
                            Icons.add,
                            color: AppColor.white,
                            size: 16.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      SizedBox(
                        height: 24.h,
                        width: 24.h,
                        child: FloatingActionButton(
                          onPressed: () => _zoomOut(),
                          backgroundColor: AppColor.black.withOpacity(0.3),
                          heroTag: 'zoom_out',
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r)),
                          child: Icon(
                            Icons.remove,
                            color: AppColor.white,
                            size: 16.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      SizedBox(
                        height: 24.h,
                        width: 24.h,
                        child: FloatingActionButton(
                          onPressed: () => _goMyLocation(),
                          backgroundColor: AppColor.black.withOpacity(0.3),
                          heroTag: 'my_location',
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r)),
                          child: Icon(
                            Icons.my_location,
                            color: AppColor.white,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 40.h,
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: AppText(
                  text:
                      "Selected location:   ${target.latitude.toStringAsFixed(4)}, ${target.longitude.toStringAsFixed(4)}",
                  size: 12.sp,
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }

  void _onMapCreated(YandexMapController controller) {
    _completer.complete(controller);
    controller.moveCamera(
        CameraUpdate.newCameraPosition(CameraPosition(target: initialPoint)));
    controller.moveCamera(CameraUpdate.zoomTo(12));
    // controller.toggleUserLayer(visible: true);
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

  void _pickImage() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.r))),
      builder: (context) {
        return Wrap(
          children: [
            SizedBox(
              width: ScreenUtil().screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () async {
                      await ImageService.pickImage(
                          imageSource: ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image_outlined, size: 20.sp),
                        SizedBox(width: 12.w),
                        AppText(
                            text: "Gallery",
                            color: AppColor.textColor,
                            size: 14.sp,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () async {
                      await ImageService.pickImage(
                          imageSource: ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera_enhance_outlined, size: 20.sp),
                        SizedBox(width: 12.w),
                        AppText(
                            text: "Camera",
                            color: AppColor.textColor,
                            size: 14.sp,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
