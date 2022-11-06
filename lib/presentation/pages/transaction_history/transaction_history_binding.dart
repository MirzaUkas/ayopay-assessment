import 'package:get/get.dart';

import '../../../data/repositories/transaction_repository.dart';
import '../../../domain/usecases/transaction_history_use_case.dart';
import 'transaction_history_controller.dart';

class TransactionHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => TransactionHistoryUseCase(Get.find<TransactionRepositoryImpl>()));
    Get.put(TransactionHistoryController(Get.find()));
  }
}
