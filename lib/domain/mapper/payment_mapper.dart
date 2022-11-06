import 'package:ayopay_assessment/domain/entities/payment_method_entity.dart';

import '../../data/models/payment_method_model.dart';

extension PaymentMethodListMapper on List<PaymentMethodModel> {
  List<PaymentMethodEntity> mapToEntity() =>
      map((e) => e.mapToEntity()).toList();
}

extension PaymentMethodMapper on PaymentMethodModel {
  PaymentMethodEntity mapToEntity() => PaymentMethodEntity(
        id: id ?? 0,
        icon: icon ?? "",
        fee: fee ?? 0,
        displayName: displayName ?? "",
        provider: provider ?? "-",
        steps: steps ?? [],
      );
}
