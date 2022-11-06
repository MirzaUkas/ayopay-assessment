import 'package:ayopay_assessment/data/models/payment_method_model.dart';

import '../../app/core/usecases/param_usecase.dart';
import '../repositories/payment_repository.dart';

class PaymentUseCase
    extends ParamUseCase<List<PaymentMethodModel>, String> {
  final PaymentRepository _repo;

  PaymentUseCase(this._repo);

  @override
  Future<List<PaymentMethodModel>> execute(String params) {
    return _repo.fetchPayment(params);
  }
}