import 'package:json_annotation/json_annotation.dart';

import 'payment_method_model.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  int? id;
  String? name;
  double? amount;
  double? fee;
  double? total;
  bool? status;
  String? date;
  String? time;
  @JsonKey(name: "reference_code")
  String? referenceCode;
  @JsonKey(name: "payment_method")
  PaymentMethodModel? paymentMethod;

  TransactionModel(
      {this.id,
      this.name,
      this.amount,
      this.fee,
      this.total,
      this.status,
      this.date,
      this.time,
      this.referenceCode,
      this.paymentMethod});

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
