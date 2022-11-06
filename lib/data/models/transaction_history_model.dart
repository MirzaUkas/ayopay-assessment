import 'package:json_annotation/json_annotation.dart';

import 'transaction_model.dart';

part 'transaction_history_model.g.dart';

@JsonSerializable()
class TransactionHistoryModel {
  String? date;
  List<TransactionModel>? transactions;

  TransactionHistoryModel({this.date, this.transactions});

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionHistoryModelToJson(this);
}
