import 'package:ayopay_assessment/app/extensions/number.dart';
import 'package:ayopay_assessment/domain/entities/payment_method_entity.dart';
import 'package:ayopay_assessment/domain/entities/transaction_entity.dart';
import 'package:ayopay_assessment/domain/mapper/payment_mapper.dart';
import 'package:ayopay_assessment/domain/mapper/transaction_mapper.dart';
import 'package:ayopay_assessment/domain/usecases/payment_use_case.dart';
import 'package:ayopay_assessment/domain/usecases/top_up_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopUpMethodDetailController extends GetxController
    with StateMixin<List<PaymentMethodEntity>> {
  TopUpMethodDetailController(this._paymentUseCase, this._topUpUseCase);

  late double amount;
  late TextEditingController controllerAmount;
  int? groupValue;

  final PaymentUseCase _paymentUseCase;
  final TopUpUseCase _topUpUseCase;

  @override
  void onReady() {
    amount = Get.arguments['amount'];
    controllerAmount = TextEditingController(text: amount.toRupiah());
    getPayment(Get.arguments['method']);
  }

  selectInstantPayment(int value) => groupValue = value;

  getPayment(String type) async {
    try {
      change(null, status: RxStatus.loading());
      final model = await _paymentUseCase.execute(type);
      change(model.mapToEntity(), status: RxStatus.success());
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
    }
  }

  Future<TransactionEntity?> topUp(bool type) async {
    try {
      change(null, status: RxStatus.loading());
      final model = await _topUpUseCase.execute(type);
      change([], status: RxStatus.success());
      return model.mapToEntity();
    } catch (error) {
      print("eerr: $error");
      change(null, status: RxStatus.error(error.toString()));
      return null;
    }

  }
}
