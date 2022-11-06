// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      fee: (json['fee'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      status: json['status'] as bool?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      referenceCode: json['reference_code'] as String?,
      paymentMethod: json['payment_method'] == null
          ? null
          : PaymentMethodModel.fromJson(
              json['payment_method'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'fee': instance.fee,
      'total': instance.total,
      'status': instance.status,
      'date': instance.date,
      'time': instance.time,
      'reference_code': instance.referenceCode,
      'payment_method': instance.paymentMethod,
    };
