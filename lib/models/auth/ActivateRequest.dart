class ActivateRequest {
  String? phone;
  String? deviceToken;
  String? deviceType;
  String? code;

  ActivateRequest(
      {required this.phone,
      required this.deviceToken,
      required this.deviceType,
      required this.code});
}
