// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethodModel _$PaymentMethodModelFromJson(Map<String, dynamic> json) =>
    PaymentMethodModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      provider: json['provider'] as String?,
      providerType: json['provider_type'] as String?,
      displayName: json['display_name'] as String?,
      icon: json['icon'] as String?,
      type: json['type'] as String?,
      fee: (json['fee'] as num?)?.toDouble(),
      steps:
          (json['steps'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PaymentMethodModelToJson(PaymentMethodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'provider': instance.provider,
      'provider_type': instance.providerType,
      'display_name': instance.displayName,
      'fee': instance.fee,
      'icon': instance.icon,
      'type': instance.type,
      'steps': instance.steps,
    };
