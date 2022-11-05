import 'payment_method_entity.dart';

class TransactionHistoryEntity {
  String date;
  List<TransactionEntity> transactions;

  TransactionHistoryEntity({
    required this.date,
    required this.transactions,
  });
}

class TransactionEntity {
  String name;
  PaymentMethodEntity paymentMethod;
  double amount;

  TransactionEntity({
    required this.name,
    required this.paymentMethod,
    required this.amount,
  });
}

