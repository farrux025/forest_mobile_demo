class RuxsatnomaRequest {
  String? email;
  String? phoneNumber;
  String? passpord;
  String? username;
  String? stir;
  String? address;
  String? companyName;
  String? companyDirector;
  String? companyBankName;
  String? companyMfo;
  String? companyPhone;
  String? companyAccountNumber;
  String? companyAddress;
  String? type;
  bool? isLegal;
  Animals? animals;
  String? description;
  int? department;
  String? sectionInfo;
  int? rotationInfo;
  int? contourInfo;
  int? massiveInfo;
  int? hectare;
  int? weight;

  RuxsatnomaRequest({
    this.email,
    this.phoneNumber,
    this.passpord,
    this.username,
    this.stir,
    this.address,
    this.companyName,
    this.companyDirector,
    this.companyBankName,
    this.companyMfo,
    this.companyPhone,
    this.companyAccountNumber,
    this.companyAddress,
    this.type,
    this.isLegal,
    this.animals,
    this.description,
    this.department,
    this.sectionInfo,
    this.rotationInfo,
    this.contourInfo,
    this.massiveInfo,
    this.hectare,
    this.weight,
  });

  RuxsatnomaRequest.fromJson(dynamic json) {
    email = json['email'];
    phoneNumber = json['phone_number'];
    passpord = json['passpord'];
    username = json['username'];
    stir = json['stir'];
    address = json['address'];
    companyName = json['company_name'];
    companyDirector = json['company_director'];
    companyBankName = json['company_bank_name'];
    companyMfo = json['company_mfo'];
    companyPhone = json['company_phone'];
    companyAccountNumber = json['company_account_number'];
    companyAddress = json['company_address'];
    type = json['type'];
    isLegal = json['is_legal'];
    animals =
        json['animals'] != null ? Animals.fromJson(json['animals']) : null;
    description = json['description'];
    department = json['department'];
    sectionInfo = json['section_info'];
    rotationInfo = json['rotation_info'];
    contourInfo = json['contour_info'];
    massiveInfo = json['massive_info'];
    hectare = json['hectare'];
    weight = json['weight'];
  }

  RuxsatnomaRequest copyWith({
    String? email,
    String? phoneNumber,
    String? passpord,
    String? username,
    String? stir,
    String? address,
    String? companyName,
    String? companyDirector,
    String? companyBankName,
    String? companyMfo,
    String? companyPhone,
    String? companyAccountNumber,
    String? companyAddress,
    String? type,
    bool? isLegal,
    Animals? animals,
    String? description,
    int? department,
    String? sectionInfo,
    int? rotationInfo,
    int? contourInfo,
    int? massiveInfo,
    int? hectare,
    int? weight,
  }) =>
      RuxsatnomaRequest(
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        passpord: passpord ?? this.passpord,
        username: username ?? this.username,
        stir: stir ?? this.stir,
        address: address ?? this.address,
        companyName: companyName ?? this.companyName,
        companyDirector: companyDirector ?? this.companyDirector,
        companyBankName: companyBankName ?? this.companyBankName,
        companyMfo: companyMfo ?? this.companyMfo,
        companyPhone: companyPhone ?? this.companyPhone,
        companyAccountNumber: companyAccountNumber ?? this.companyAccountNumber,
        companyAddress: companyAddress ?? this.companyAddress,
        type: type ?? this.type,
        isLegal: isLegal ?? this.isLegal,
        animals: animals ?? this.animals,
        description: description ?? this.description,
        department: department ?? this.department,
        sectionInfo: sectionInfo ?? this.sectionInfo,
        rotationInfo: rotationInfo ?? this.rotationInfo,
        contourInfo: contourInfo ?? this.contourInfo,
        massiveInfo: massiveInfo ?? this.massiveInfo,
        hectare: hectare ?? this.hectare,
        weight: weight ?? this.weight,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['phone_number'] = phoneNumber;
    map['passpord'] = passpord;
    map['username'] = username;
    map['stir'] = stir;
    map['address'] = address;
    map['company_name'] = companyName;
    map['company_director'] = companyDirector;
    map['company_bank_name'] = companyBankName;
    map['company_mfo'] = companyMfo;
    map['company_phone'] = companyPhone;
    map['company_account_number'] = companyAccountNumber;
    map['company_address'] = companyAddress;
    map['type'] = type;
    map['is_legal'] = isLegal;
    if (animals != null) {
      map['animals'] = animals?.toJson();
    }
    map['description'] = description;
    map['department'] = department;
    map['section_info'] = sectionInfo;
    map['rotation_info'] = rotationInfo;
    map['contour_info'] = contourInfo;
    map['massive_info'] = massiveInfo;
    map['hectare'] = hectare;
    map['weight'] = weight;
    return map;
  }
}

class Animals {
  Animals({
    this.bigAnimals,
    this.midAnimals,
    this.bigSheep,
    this.midSheep,
  });

  Animals.fromJson(dynamic json) {
    bigAnimals = json['big_animals'] != null
        ? BigAnimals.fromJson(json['big_animals'])
        : null;
    midAnimals = json['mid_animals'] != null
        ? MidAnimals.fromJson(json['mid_animals'])
        : null;
    bigSheep =
        json['big_sheep'] != null ? BigSheep.fromJson(json['big_sheep']) : null;
    midSheep =
        json['mid_sheep'] != null ? MidSheep.fromJson(json['mid_sheep']) : null;
  }

  BigAnimals? bigAnimals;
  MidAnimals? midAnimals;
  BigSheep? bigSheep;
  MidSheep? midSheep;

  Animals copyWith({
    BigAnimals? bigAnimals,
    MidAnimals? midAnimals,
    BigSheep? bigSheep,
    MidSheep? midSheep,
  }) =>
      Animals(
        bigAnimals: bigAnimals ?? this.bigAnimals,
        midAnimals: midAnimals ?? this.midAnimals,
        bigSheep: bigSheep ?? this.bigSheep,
        midSheep: midSheep ?? this.midSheep,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (bigAnimals != null) {
      map['big_animals'] = bigAnimals?.toJson();
    }
    if (midAnimals != null) {
      map['mid_animals'] = midAnimals?.toJson();
    }
    if (bigSheep != null) {
      map['big_sheep'] = bigSheep?.toJson();
    }
    if (midSheep != null) {
      map['mid_sheep'] = midSheep?.toJson();
    }
    return map;
  }
}

class MidSheep {
  MidSheep({
    this.midSheep,
    this.midGoat,
  });

  MidSheep.fromJson(dynamic json) {
    midSheep = json['mid_sheep'];
    midGoat = json['mid_goat'];
  }

  int? midSheep;
  int? midGoat;

  MidSheep copyWith({
    int? midSheep,
    int? midGoat,
  }) =>
      MidSheep(
        midSheep: midSheep ?? this.midSheep,
        midGoat: midGoat ?? this.midGoat,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mid_sheep'] = midSheep;
    map['mid_goat'] = midGoat;
    return map;
  }
}

class BigSheep {
  BigSheep({
    this.bigSheep,
    this.bigGoat,
  });

  BigSheep.fromJson(dynamic json) {
    bigSheep = json['big_sheep'];
    bigGoat = json['big_goat'];
  }

  int? bigSheep;
  int? bigGoat;

  BigSheep copyWith({
    int? bigSheep,
    int? bigGoat,
  }) =>
      BigSheep(
        bigSheep: bigSheep ?? this.bigSheep,
        bigGoat: bigGoat ?? this.bigGoat,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['big_sheep'] = bigSheep;
    map['big_goat'] = bigGoat;
    return map;
  }
}

class MidAnimals {
  MidAnimals({
    this.midCattle,
    this.midHorse,
    this.midCamels,
    this.midDonkey,
  });

  MidAnimals.fromJson(dynamic json) {
    midCattle = json['mid_cattle'];
    midHorse = json['mid_horse'];
    midCamels = json['mid_camels'];
    midDonkey = json['mid_donkey'];
  }

  int? midCattle;
  int? midHorse;
  int? midCamels;
  int? midDonkey;

  MidAnimals copyWith({
    int? midCattle,
    int? midHorse,
    int? midCamels,
    int? midDonkey,
  }) =>
      MidAnimals(
        midCattle: midCattle ?? this.midCattle,
        midHorse: midHorse ?? this.midHorse,
        midCamels: midCamels ?? this.midCamels,
        midDonkey: midDonkey ?? this.midDonkey,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mid_cattle'] = midCattle;
    map['mid_horse'] = midHorse;
    map['mid_camels'] = midCamels;
    map['mid_donkey'] = midDonkey;
    return map;
  }
}

class BigAnimals {
  BigAnimals({
    this.bigCattle,
    this.bigHorse,
    this.bigCamels,
    this.bigDonkey,
  });

  BigAnimals.fromJson(dynamic json) {
    bigCattle = json['big_cattle'];
    bigHorse = json['big_horse'];
    bigCamels = json['big_camels'];
    bigDonkey = json['big_donkey'];
  }

  int? bigCattle;
  int? bigHorse;
  int? bigCamels;
  int? bigDonkey;

  BigAnimals copyWith({
    int? bigCattle,
    int? bigHorse,
    int? bigCamels,
    int? bigDonkey,
  }) =>
      BigAnimals(
        bigCattle: bigCattle ?? this.bigCattle,
        bigHorse: bigHorse ?? this.bigHorse,
        bigCamels: bigCamels ?? this.bigCamels,
        bigDonkey: bigDonkey ?? this.bigDonkey,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['big_cattle'] = bigCattle;
    map['big_horse'] = bigHorse;
    map['big_camels'] = bigCamels;
    map['big_donkey'] = bigDonkey;
    return map;
  }
}
