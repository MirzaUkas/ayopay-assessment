
import '../../app/core/usecases/param_usecase.dart';
import '../../data/models/transaction_model.dart';
import '../repositories/payment_repository.dart';

class TopUpUseCase extends ParamUseCase<TransactionModel, bool> {
  final PaymentRepository _repo;

  TopUpUseCase(this._repo);

  @override
  Future<TransactionModel> execute(bool params) {
    return _repo.fetchTopUp(params);
  }
}