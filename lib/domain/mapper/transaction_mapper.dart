import 'package:ayopay_assessment/data/models/transaction_history_model.dart';
import 'package:ayopay_assessment/data/models/transaction_model.dart';
import 'package:ayopay_assessment/domain/entities/payment_method_entity.dart';
import 'package:ayopay_assessment/domain/entities/transaction_entity.dart';

extension TransactionListMapper on List<TransactionHistoryModel> {
  List<TransactionHistoryEntity> mapToEntity() =>
      map((e) => TransactionHistoryEntity(
            date: e.date ?? "",
            transactions:
                e.transactions?.map((e) => e.mapToEntity()).toList() ?? [],
          )).toList();
}

extension TransactionDetailMapper on TransactionModel {
  TransactionEntity mapToEntity() => TransactionEntity(
        id: id ?? 0,
        name: name ?? "",
        status: status ?? false,
        date: date ?? "",
        time: time ?? "",
        referenceCode: referenceCode ?? "",
        amount: amount ?? 0,
        fee: fee ?? 0,
        total: total ?? 0,
        paymentMethod: PaymentMethodEntity(
          id: paymentMethod?.id ?? 0,
          icon: paymentMethod?.icon ?? "",
          fee: paymentMethod?.fee ?? 0,
          displayName: paymentMethod?.displayName ?? "",
          provider: paymentMethod?.provider ?? "-",
          steps: paymentMethod?.steps ?? [],
        ),
      );
}
