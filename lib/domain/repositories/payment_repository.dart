
import '../../data/models/payment_method_model.dart';
import '../../data/models/transaction_model.dart';

abstract class PaymentRepository {
  Future<List<PaymentMethodModel>> fetchPayment(String type);
  Future<TransactionModel> fetchTopUp(bool isSuccess);
}