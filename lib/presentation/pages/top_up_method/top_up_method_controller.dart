import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TopUpMethodController extends GetxController {
  final amountIndex = 1.obs;
  var toggleValue = 0.obs;
  TextEditingController controllerAmount = TextEditingController();
  final List<double> amounts = [10000, 20000, 50000, 100000, 200000, 500000];

  setToggle(int value) => toggleValue.value = value;

  setChipAmount(int value) => amountIndex.value = value;

  double getSelectedAmount() => controllerAmount.text.isEmpty
      ? amounts[amountIndex.value]
      : double.parse(controllerAmount.text);
}
