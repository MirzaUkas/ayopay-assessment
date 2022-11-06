import 'package:ayopay_assessment/data/repositories/payment_repository.dart';
import 'package:ayopay_assessment/data/repositories/transaction_repository.dart';
import 'package:get/get.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => TransactionRepositoryImpl(), fenix: true);
    Get.lazyPut(() => PaymentRepositoryImpl(), fenix: true);
  }
}
