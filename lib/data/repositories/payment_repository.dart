import 'package:ayopay_assessment/data/models/transaction_model.dart';

import '../../domain/repositories/payment_repository.dart';
import '../models/payment_method_model.dart';
import '../providers/network/apis/payment_api.dart';

class PaymentRepositoryImpl extends PaymentRepository {
  @override
  Future<List<PaymentMethodModel>> fetchPayment(String type) async {
    final response = await PaymentAPI.fetchPayment(type).request();
    return List.from(response.map((x) => PaymentMethodModel.fromJson(x)));
  }

  @override
  Future<TransactionModel> fetchTopUp(bool isSuccess) async {
    final response = await PaymentAPI.fetchTopUp(isSuccess).request();
    return List.from(response.map((x) => TransactionModel.fromJson(x))).first;
  }
}
