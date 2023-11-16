import 'package:forest_mobile/service/hive/hive_store.dart';
import 'package:hive/hive.dart';

part 'BHMPrice.g.dart';

@HiveType(typeId: MyHiveTypeId.bhmPriceBoxID)
class BhmPrice {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? createdAt;
  @HiveField(2)
  String? updatedAt;
  @HiveField(3)
  String? bhm;
  @HiveField(4)
  String? legalApplicationFee;
  @HiveField(5)
  String? unlegalApplicationFee;
  @HiveField(6)
  int? reviewPeriod;
  @HiveField(7)
  String? bigAnimalsPrice;
  @HiveField(8)
  String? middleAnimalsPrice;
  @HiveField(9)
  String? bigSheepsGoatsPrice;
  @HiveField(10)
  String? middleSheepsGoatsPrice;
  @HiveField(11)
  String? haymakingPrice;
  @HiveField(12)
  int? deadlineReceipt;
  @HiveField(13)
  int? deadlineReview;
  @HiveField(14)
  int? deadlineRentPayment;
  @HiveField(15)
  int? deadlineToGivePermission;
  @HiveField(16)
  bool? smsNotification;

  BhmPrice({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.bhm,
    this.legalApplicationFee,
    this.unlegalApplicationFee,
    this.reviewPeriod,
    this.bigAnimalsPrice,
    this.middleAnimalsPrice,
    this.bigSheepsGoatsPrice,
    this.middleSheepsGoatsPrice,
    this.haymakingPrice,
    this.deadlineReceipt,
    this.deadlineReview,
    this.deadlineRentPayment,
    this.deadlineToGivePermission,
    this.smsNotification,
  });

  BhmPrice.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bhm = json['bhm'];
    legalApplicationFee = json['legal_application_fee'];
    unlegalApplicationFee = json['unlegal_application_fee'];
    reviewPeriod = json['review_period'];
    bigAnimalsPrice = json['big_animals_price'];
    middleAnimalsPrice = json['middle_animals_price'];
    bigSheepsGoatsPrice = json['big_sheeps_goats_price'];
    middleSheepsGoatsPrice = json['middle_sheeps_goats_price'];
    haymakingPrice = json['haymaking_price'];
    deadlineReceipt = json['deadline_receipt'];
    deadlineReview = json['deadline_review'];
    deadlineRentPayment = json['deadline_rent_payment'];
    deadlineToGivePermission = json['deadline_to_give_permission'];
    smsNotification = json['sms_notification'];
  }

  BhmPrice copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? bhm,
    String? legalApplicationFee,
    String? unlegalApplicationFee,
    int? reviewPeriod,
    String? bigAnimalsPrice,
    String? middleAnimalsPrice,
    String? bigSheepsGoatsPrice,
    String? middleSheepsGoatsPrice,
    String? haymakingPrice,
    int? deadlineReceipt,
    int? deadlineReview,
    int? deadlineRentPayment,
    int? deadlineToGivePermission,
    bool? smsNotification,
  }) =>
      BhmPrice(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        bhm: bhm ?? this.bhm,
        legalApplicationFee: legalApplicationFee ?? this.legalApplicationFee,
        unlegalApplicationFee:
            unlegalApplicationFee ?? this.unlegalApplicationFee,
        reviewPeriod: reviewPeriod ?? this.reviewPeriod,
        bigAnimalsPrice: bigAnimalsPrice ?? this.bigAnimalsPrice,
        middleAnimalsPrice: middleAnimalsPrice ?? this.middleAnimalsPrice,
        bigSheepsGoatsPrice: bigSheepsGoatsPrice ?? this.bigSheepsGoatsPrice,
        middleSheepsGoatsPrice:
            middleSheepsGoatsPrice ?? this.middleSheepsGoatsPrice,
        haymakingPrice: haymakingPrice ?? this.haymakingPrice,
        deadlineReceipt: deadlineReceipt ?? this.deadlineReceipt,
        deadlineReview: deadlineReview ?? this.deadlineReview,
        deadlineRentPayment: deadlineRentPayment ?? this.deadlineRentPayment,
        deadlineToGivePermission:
            deadlineToGivePermission ?? this.deadlineToGivePermission,
        smsNotification: smsNotification ?? this.smsNotification,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['bhm'] = bhm;
    map['legal_application_fee'] = legalApplicationFee;
    map['unlegal_application_fee'] = unlegalApplicationFee;
    map['review_period'] = reviewPeriod;
    map['big_animals_price'] = bigAnimalsPrice;
    map['middle_animals_price'] = middleAnimalsPrice;
    map['big_sheeps_goats_price'] = bigSheepsGoatsPrice;
    map['middle_sheeps_goats_price'] = middleSheepsGoatsPrice;
    map['haymaking_price'] = haymakingPrice;
    map['deadline_receipt'] = deadlineReceipt;
    map['deadline_review'] = deadlineReview;
    map['deadline_rent_payment'] = deadlineRentPayment;
    map['deadline_to_give_permission'] = deadlineToGivePermission;
    map['sms_notification'] = smsNotification;
    return map;
  }
}
