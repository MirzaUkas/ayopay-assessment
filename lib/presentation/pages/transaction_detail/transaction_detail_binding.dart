import 'package:ayopay_assessment/presentation/pages/transaction_detail/transaction_detail_controller.dart';
import 'package:get/get.dart';

import '../../../data/repositories/transaction_repository.dart';
import '../../../domain/usecases/transaction_detail_use_case.dart';

class TransactionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
            () => TransactionDetailUseCase(Get.find<TransactionRepositoryImpl>()));
    Get.put(TransactionDetailController(Get.find()));

  }
}
