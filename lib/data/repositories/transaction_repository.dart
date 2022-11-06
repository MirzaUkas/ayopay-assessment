import '../../domain/repositories/transaction_repository.dart';
import '../models/transaction_history_model.dart';
import '../models/transaction_model.dart';
import '../providers/network/apis/transaction_api.dart';

class TransactionRepositoryImpl extends TransactionRepository {
  @override
  Future<TransactionModel> fetchDetail(int id) async {
    final response = await TransactionAPI.fetchDetail(id).request();
    return TransactionModel.fromJson(response);
  }

  @override
  Future<List<TransactionHistoryModel>> fetchHistory() async {
    final response = await TransactionAPI.fetchHistory().request();
    return List.from(
        response.map((x) => TransactionHistoryModel.fromJson(x)));
  }
}
