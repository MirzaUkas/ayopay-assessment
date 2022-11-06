import '../../app/core/usecases/no_param_usecase.dart';
import '../../data/models/transaction_history_model.dart';
import '../repositories/transaction_repository.dart';

class TransactionHistoryUseCase
    extends NoParamUseCase<List<TransactionHistoryModel>> {
  final TransactionRepository _repo;

  TransactionHistoryUseCase(this._repo);

  @override
  Future<List<TransactionHistoryModel>> execute() {
    return _repo.fetchHistory();
  }
}
