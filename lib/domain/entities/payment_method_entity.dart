class PaymentMethodEntity {
  String provider;
  String icon;
  List<String> steps;

  PaymentMethodEntity({
    required this.provider,
    required this.icon,
    required this.steps,
  });
}
