// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionHistoryModel _$TransactionHistoryModelFromJson(
        Map<String, dynamic> json) =>
    TransactionHistoryModel(
      date: json['date'] as String?,
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionHistoryModelToJson(
        TransactionHistoryModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'transactions': instance.transactions,
    };
