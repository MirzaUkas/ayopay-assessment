
import 'package:ayopay_assessment/data/repositories/payment_repository.dart';
import 'package:ayopay_assessment/domain/usecases/payment_use_case.dart';
import 'package:ayopay_assessment/domain/usecases/top_up_use_case.dart';
import 'package:ayopay_assessment/presentation/pages/top_up_method_detail/top_up_method_detail_controller.dart';
import 'package:get/get.dart';

class TopUpMethodDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
            () => PaymentUseCase(Get.find<PaymentRepositoryImpl>()));
    Get.lazyPut(
            () => TopUpUseCase(Get.find<PaymentRepositoryImpl>()));
    Get.put(TopUpMethodDetailController(Get.find(), Get.find()));
  }
}
