import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:forest_mobile/constants/variables.dart';
import 'package:forest_mobile/service/dio_client.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class ImageService {
  static pickImage({required ImageSource imageSource}) async {
    try {
      var image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      // var image2 = img.Image(width: 256, height: 256);
      // img.Command()
      //   ..decodePngFile(image.path)
      //   ..copyResize(width: 256)
      //   ..writeToFile('path')
      //   ..executeThread();
      var file = File(image.path);
      log("Image path: ${file.path}");
      await _uploadImage(file).then((response) {
        log("Upload response; $response");
        MyValueNotifiers.uploadImageNotifier.value =
            MyValueNotifiers.uploadImageLoaded;
      });
    } on DioException catch (exc) {
      MyValueNotifiers.uploadImageNotifier.value =
          MyValueNotifiers.uploadImageError;
      log("Upload image dio exception: $exc");
    } catch (e) {
      MyValueNotifiers.uploadImageNotifier.value =
          MyValueNotifiers.uploadImageError;
      log("Upload image error: $e");
    }
  }

  static Future<Response<dynamic>> _uploadImage(File file) async {
    MyValueNotifiers.uploadImageNotifier.value =
        MyValueNotifiers.uploadImageLoading;
    var fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "multipartFile": await MultipartFile.fromFile(
        file.path ?? '',
        filename: fileName,
        contentType: MediaType("image", "png"),
      ),
      "type": "image/png",
    });
    return await DioClient.instance.post(AppUrl.uploadImageUrl,
        data: formData,
        options: Options(headers: {
          "accept": "*/*",
          "Content-type": "multipart/form-data",
        }));
  }
}
