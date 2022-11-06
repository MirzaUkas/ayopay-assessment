import 'package:ayopay_assessment/domain/entities/transaction_entity.dart';
import 'package:ayopay_assessment/domain/mapper/transaction_mapper.dart';
import 'package:ayopay_assessment/domain/usecases/transaction_history_use_case.dart';
import 'package:get/get.dart';

class TransactionHistoryController extends GetxController
    with StateMixin<List<TransactionHistoryEntity>> {
  TransactionHistoryController(this._transactionHistoryUseCase);

  final TransactionHistoryUseCase _transactionHistoryUseCase;

  @override
  void onReady() {
    getTransactionHistory();
  }

  getTransactionHistory() async {
    try {
      change(null, status: RxStatus.loading());
      final model = await _transactionHistoryUseCase.execute();
      change(model.mapToEntity(), status: RxStatus.success());
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
    }
  }
}
