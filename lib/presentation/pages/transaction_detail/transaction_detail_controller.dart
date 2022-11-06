import 'package:ayopay_assessment/domain/entities/transaction_entity.dart';
import 'package:ayopay_assessment/domain/mapper/transaction_mapper.dart';
import 'package:ayopay_assessment/domain/usecases/transaction_detail_use_case.dart';
import 'package:get/get.dart';

class TransactionDetailController extends GetxController
    with StateMixin<TransactionEntity> {
  TransactionDetailController(this._transactionDetailUseCase);

  final TransactionDetailUseCase _transactionDetailUseCase;

  @override
  void onReady() {
    getTransaction(Get.arguments['id']);
  }

  getTransaction(int id) async {
    try {
      change(null, status: RxStatus.loading());
      final model = await _transactionDetailUseCase.execute(id);
      change(model.mapToEntity(), status: RxStatus.success());
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
    }
  }
}
