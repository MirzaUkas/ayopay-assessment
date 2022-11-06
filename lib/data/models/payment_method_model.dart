import 'package:json_annotation/json_annotation.dart';

part 'payment_method_model.g.dart';

@JsonSerializable()
class PaymentMethodModel {
  int? id;
  String? name;
  String? provider;
  @JsonKey(name: "provider_type")
  String? providerType;
  @JsonKey(name: "display_name")
  String? displayName;
  double? fee;
  String? icon;
  String? type;
  List<String>? steps;

  PaymentMethodModel({
    this.id,
    this.name,
    this.provider,
    this.providerType,
    this.displayName,
    this.icon,
    this.type,
    this.fee,
    this.steps,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodModelToJson(this);
}
