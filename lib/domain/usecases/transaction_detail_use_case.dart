
import '../../app/core/usecases/param_usecase.dart';
import '../../data/models/transaction_model.dart';
import '../repositories/transaction_repository.dart';

class TransactionDetailUseCase
    extends ParamUseCase<TransactionModel, int> {
  final TransactionRepository _repo;

  TransactionDetailUseCase(this._repo);

  @override
  Future<TransactionModel> execute(int params) {
    return _repo.fetchDetail(params);
  }
}
