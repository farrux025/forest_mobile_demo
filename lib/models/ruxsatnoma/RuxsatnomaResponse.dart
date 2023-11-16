class RuxsatnomaResponse {
  RuxsatnomaResponse({
    this.msg,
    this.data,
  });

  RuxsatnomaResponse.fromJson(dynamic json) {
    msg = json['msg'];
    data = json['data'] != null
        ? RuxsatnomaResponseData.fromJson(json['data'])
        : null;
  }

  String? msg;
  RuxsatnomaResponseData? data;

  RuxsatnomaResponse copyWith({
    String? msg,
    RuxsatnomaResponseData? data,
  }) =>
      RuxsatnomaResponse(
        msg: msg ?? this.msg,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class RuxsatnomaResponseData {
  RuxsatnomaResponseData({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.serialNo,
    this.applicationNumber,
    this.type,
    this.description,
    this.username,
    this.companyName,
    this.companyDirector,
    this.companyBankName,
    this.companyMfo,
    this.companyPhone,
    this.companyAccountNumber,
    this.companyAddress,
    this.address,
    this.stir,
    this.phoneNumber,
    this.passport,
    this.isLegalEntity,
    this.sectionInfo,
    this.rotationInfo,
    this.contourInfo,
    this.massiveInfo,
    this.rentAmount,
    this.eriUser,
    this.eriData,
    this.startDate,
    this.expireDate,
    this.status,
    this.deadline,
    this.deadlineCause,
    this.taskId,
    this.respData,
    this.user,
    this.department,
    this.contour,
    this.massive,
  });

  RuxsatnomaResponseData.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    serialNo = json['serial_no'];
    applicationNumber = json['application_number'];
    type = json['type'];
    description = json['description'];
    username = json['username'];
    companyName = json['company_name'];
    companyDirector = json['company_director'];
    companyBankName = json['company_bank_name'];
    companyMfo = json['company_mfo'];
    companyPhone = json['company_phone'];
    companyAccountNumber = json['company_account_number'];
    companyAddress = json['company_address'];
    address = json['address'];
    stir = json['stir'];
    phoneNumber = json['phone_number'];
    passport = json['passport'];
    isLegalEntity = json['is_legal_entity'];
    sectionInfo = json['section_info'];
    rotationInfo = json['rotation_info'];
    contourInfo = json['contour_info'];
    massiveInfo = json['massive_info'];
    rentAmount = json['rent_amount'];
    eriUser = json['eri_user'];
    eriData = json['eri_data'];
    startDate = json['start_date'];
    expireDate = json['expire_date'];
    status = json['status'];
    deadline = json['deadline'];
    deadlineCause = json['deadline_cause'];
    taskId = json['task_id'];
    respData = json['resp_data'];
    user = json['user'];
    department = json['department'];
    contour = json['contour'];
    massive = json['massive'];
  }

  int? id;
  String? createdAt;
  String? updatedAt;
  dynamic serialNo;
  String? applicationNumber;
  String? type;
  String? description;
  String? username;
  String? companyName;
  String? companyDirector;
  String? companyBankName;
  String? companyMfo;
  String? companyPhone;
  String? companyAccountNumber;
  String? companyAddress;
  String? address;
  String? stir;
  String? phoneNumber;
  dynamic passport;
  bool? isLegalEntity;
  String? sectionInfo;
  String? rotationInfo;
  String? contourInfo;
  String? massiveInfo;
  String? rentAmount;
  dynamic eriUser;
  dynamic eriData;
  dynamic startDate;
  dynamic expireDate;
  int? status;
  dynamic deadline;
  dynamic deadlineCause;
  dynamic taskId;
  dynamic respData;
  int? user;
  int? department;
  dynamic contour;
  dynamic massive;

  RuxsatnomaResponseData copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    dynamic serialNo,
    String? applicationNumber,
    String? type,
    String? description,
    String? username,
    String? companyName,
    String? companyDirector,
    String? companyBankName,
    String? companyMfo,
    String? companyPhone,
    String? companyAccountNumber,
    String? companyAddress,
    String? address,
    String? stir,
    String? phoneNumber,
    dynamic passport,
    bool? isLegalEntity,
    String? sectionInfo,
    String? rotationInfo,
    String? contourInfo,
    String? massiveInfo,
    String? rentAmount,
    dynamic eriUser,
    dynamic eriData,
    dynamic startDate,
    dynamic expireDate,
    int? status,
    dynamic deadline,
    dynamic deadlineCause,
    dynamic taskId,
    dynamic respData,
    int? user,
    int? department,
    dynamic contour,
    dynamic massive,
  }) =>
      RuxsatnomaResponseData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        serialNo: serialNo ?? this.serialNo,
        applicationNumber: applicationNumber ?? this.applicationNumber,
        type: type ?? this.type,
        description: description ?? this.description,
        username: username ?? this.username,
        companyName: companyName ?? this.companyName,
        companyDirector: companyDirector ?? this.companyDirector,
        companyBankName: companyBankName ?? this.companyBankName,
        companyMfo: companyMfo ?? this.companyMfo,
        companyPhone: companyPhone ?? this.companyPhone,
        companyAccountNumber: companyAccountNumber ?? this.companyAccountNumber,
        companyAddress: companyAddress ?? this.companyAddress,
        address: address ?? this.address,
        stir: stir ?? this.stir,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        passport: passport ?? this.passport,
        isLegalEntity: isLegalEntity ?? this.isLegalEntity,
        sectionInfo: sectionInfo ?? this.sectionInfo,
        rotationInfo: rotationInfo ?? this.rotationInfo,
        contourInfo: contourInfo ?? this.contourInfo,
        massiveInfo: massiveInfo ?? this.massiveInfo,
        rentAmount: rentAmount ?? this.rentAmount,
        eriUser: eriUser ?? this.eriUser,
        eriData: eriData ?? this.eriData,
        startDate: startDate ?? this.startDate,
        expireDate: expireDate ?? this.expireDate,
        status: status ?? this.status,
        deadline: deadline ?? this.deadline,
        deadlineCause: deadlineCause ?? this.deadlineCause,
        taskId: taskId ?? this.taskId,
        respData: respData ?? this.respData,
        user: user ?? this.user,
        department: department ?? this.department,
        contour: contour ?? this.contour,
        massive: massive ?? this.massive,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['serial_no'] = serialNo;
    map['application_number'] = applicationNumber;
    map['type'] = type;
    map['description'] = description;
    map['username'] = username;
    map['company_name'] = companyName;
    map['company_director'] = companyDirector;
    map['company_bank_name'] = companyBankName;
    map['company_mfo'] = companyMfo;
    map['company_phone'] = companyPhone;
    map['company_account_number'] = companyAccountNumber;
    map['company_address'] = companyAddress;
    map['address'] = address;
    map['stir'] = stir;
    map['phone_number'] = phoneNumber;
    map['passport'] = passport;
    map['is_legal_entity'] = isLegalEntity;
    map['section_info'] = sectionInfo;
    map['rotation_info'] = rotationInfo;
    map['contour_info'] = contourInfo;
    map['massive_info'] = massiveInfo;
    map['rent_amount'] = rentAmount;
    map['eri_user'] = eriUser;
    map['eri_data'] = eriData;
    map['start_date'] = startDate;
    map['expire_date'] = expireDate;
    map['status'] = status;
    map['deadline'] = deadline;
    map['deadline_cause'] = deadlineCause;
    map['task_id'] = taskId;
    map['resp_data'] = respData;
    map['user'] = user;
    map['department'] = department;
    map['contour'] = contour;
    map['massive'] = massive;
    return map;
  }
}
