import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'dart:developer';

class Mask {
  static MaskTextInputFormatter PHONE_NUMBER = MaskTextInputFormatter(
      mask: "(##) ###-##-##",
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
}

const PREFIX_PHONE = "+998 ";

String? AppTextValidator(String? val, {
  bool? required,
  int? maxLength,
  int? minLength,
  String? regex,
  List<int>? availableLength,
  String? equalText,
  double? minAmount,
  double? maxAmount,
  String? confirm,
}) {
  log("Validator value => $val");

  if (canValidate(required) && (val == null || val.isEmpty)) {
    return "Please, complete this field";
  }
  if (maxLength != null && (val == null || val.length > maxLength)) {
    return "Kamida $maxLength ta belgi";
  }
  if (minLength != null && (val == null || val.length < minLength)) {
    return "Minimal belgilar uzunligi: $minLength";
  }
  if (regex != null && (val == null || !RegExp(regex).hasMatch(val))) {
    return "Bu maydonni to'ldirish majburiy, format noto‘g‘ri";
  }
  if (availableLength != null &&
      (val == null || !availableLength.contains(val.length))) {
    return "Qiymat uzunligi bo'lishi kerak: ${availableLength.map((
        e) => '$e')}";
  }
  if (equalText != null && (val == null || val != equalText)) {
    return "Tasdiqlash kodi noto'g'ri kiritilgan";
  }

  return null;
}

bool canValidate(bool? val) {
  return val != null && val;
}
