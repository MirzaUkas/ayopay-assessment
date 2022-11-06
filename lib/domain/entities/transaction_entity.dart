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
  int id;
  String name;
  double amount;
  double fee;
  double total;
  bool status;
  String date;
  String time;
  String referenceCode;
  PaymentMethodEntity paymentMethod;

  TransactionEntity({
    required this.id,
    required this.name,
    required this.amount,
    required this.fee,
    required this.total,
    required this.status,
    required this.date,
    required this.time,
    required this.referenceCode,
    required this.paymentMethod
  });
}

