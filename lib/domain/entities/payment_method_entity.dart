class PaymentMethodEntity {
  int id;
  String provider;
  String displayName;
  String icon;
  double fee;
  List<String> steps;

  PaymentMethodEntity({
    required this.id,
    required this.provider,
    required this.displayName,
    required this.fee,
    required this.icon,
    required this.steps,
  });
}
