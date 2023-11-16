import 'package:hive/hive.dart';

part 'OneIdResData.g.dart';

@HiveType(typeId: 21)
class OneIdResData {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? username;
  @HiveField(2)
  String? pin;
  @HiveField(3)
  String? email;
  @HiveField(4)
  int? status;
  @HiveField(5)
  String? stir;
  @HiveField(6)
  String? passport;
  @HiveField(7)
  String? firstName;
  @HiveField(8)
  String? surName;
  @HiveField(9)
  String? midName;
  @HiveField(10)
  String? fullName;
  @HiveField(11)
  String? userType;
  @HiveField(12)
  String? phone;
  @HiveField(13)
  String? birthDate;
  @HiveField(14)
  String? gd;
  @HiveField(15)
  String? perAdr;
  @HiveField(16)
  String? birthPlace;
  @HiveField(17)
  String? citizenship;
  @HiveField(18)
  String? nationality;
  @HiveField(19)
  String? pportIssuePlace;
  @HiveField(20)
  String? pportIssueDate;
  @HiveField(21)
  String? pportExprDate;
  @HiveField(22)
  String? legalStir;
  @HiveField(23)
  String? legalName;
  @HiveField(24)
  bool? isLegalEntity;
  @HiveField(25)
  String? authType;
  @HiveField(26)
  String? clientType;

  OneIdResData({
    this.id,
    this.username,
    this.pin,
    this.email,
    this.status,
    this.stir,
    this.passport,
    this.firstName,
    this.surName,
    this.midName,
    this.fullName,
    this.userType,
    this.phone,
    this.birthDate,
    this.gd,
    this.perAdr,
    this.birthPlace,
    this.citizenship,
    this.nationality,
    this.pportIssuePlace,
    this.pportIssueDate,
    this.pportExprDate,
    this.legalStir,
    this.legalName,
    this.isLegalEntity,
    this.authType,
    this.clientType,
  });

  OneIdResData.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    pin = json['pin'];
    email = json['email'];
    status = json['status'];
    stir = json['stir'];
    passport = json['passport'];
    firstName = json['first_name'];
    surName = json['sur_name'];
    midName = json['mid_name'];
    fullName = json['full_name'];
    userType = json['user_type'];
    phone = json['phone'];
    birthDate = json['birth_date'];
    gd = json['gd'];
    perAdr = json['per_adr'];
    birthPlace = json['birth_place'];
    citizenship = json['citizenship'];
    nationality = json['nationality'];
    pportIssuePlace = json['pport_issue_place'];
    pportIssueDate = json['pport_issue_date'];
    pportExprDate = json['pport_expr_date'];
    legalStir = json['legal_stir'];
    legalName = json['legal_name'];
    isLegalEntity = json['is_legal_entity'];
    authType = json['auth_type'];
    clientType = json['client_type'];
  }

  OneIdResData copyWith({
    int? id,
    String? username,
    String? pin,
    String? email,
    int? status,
    String? stir,
    String? passport,
    String? firstName,
    String? surName,
    String? midName,
    String? fullName,
    String? userType,
    String? phone,
    String? birthDate,
    String? gd,
    String? perAdr,
    String? birthPlace,
    String? citizenship,
    String? nationality,
    String? pportIssuePlace,
    String? pportIssueDate,
    String? pportExprDate,
    String? legalStir,
    String? legalName,
    bool? isLegalEntity,
    String? authType,
    String? clientType,
  }) =>
      OneIdResData(
        id: id ?? this.id,
        username: username ?? this.username,
        pin: pin ?? this.pin,
        email: email ?? this.email,
        status: status ?? this.status,
        stir: stir ?? this.stir,
        passport: passport ?? this.passport,
        firstName: firstName ?? this.firstName,
        surName: surName ?? this.surName,
        midName: midName ?? this.midName,
        fullName: fullName ?? this.fullName,
        userType: userType ?? this.userType,
        phone: phone ?? this.phone,
        birthDate: birthDate ?? this.birthDate,
        gd: gd ?? this.gd,
        perAdr: perAdr ?? this.perAdr,
        birthPlace: birthPlace ?? this.birthPlace,
        citizenship: citizenship ?? this.citizenship,
        nationality: nationality ?? this.nationality,
        pportIssuePlace: pportIssuePlace ?? this.pportIssuePlace,
        pportIssueDate: pportIssueDate ?? this.pportIssueDate,
        pportExprDate: pportExprDate ?? this.pportExprDate,
        legalStir: legalStir ?? this.legalStir,
        legalName: legalName ?? this.legalName,
        isLegalEntity: isLegalEntity ?? this.isLegalEntity,
        authType: authType ?? this.authType,
        clientType: clientType ?? this.clientType,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['pin'] = pin;
    map['email'] = email;
    map['status'] = status;
    map['stir'] = stir;
    map['passport'] = passport;
    map['first_name'] = firstName;
    map['sur_name'] = surName;
    map['mid_name'] = midName;
    map['full_name'] = fullName;
    map['user_type'] = userType;
    map['phone'] = phone;
    map['birth_date'] = birthDate;
    map['gd'] = gd;
    map['per_adr'] = perAdr;
    map['birth_place'] = birthPlace;
    map['citizenship'] = citizenship;
    map['nationality'] = nationality;
    map['pport_issue_place'] = pportIssuePlace;
    map['pport_issue_date'] = pportIssueDate;
    map['pport_expr_date'] = pportExprDate;
    map['legal_stir'] = legalStir;
    map['legal_name'] = legalName;
    map['is_legal_entity'] = isLegalEntity;
    map['auth_type'] = authType;
    map['client_type'] = clientType;
    return map;
  }
}
