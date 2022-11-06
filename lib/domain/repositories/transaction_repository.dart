import '../../data/models/transaction_history_model.dart';
import '../../data/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<List<TransactionHistoryModel>> fetchHistory();
  Future<TransactionModel> fetchDetail(int id);
}