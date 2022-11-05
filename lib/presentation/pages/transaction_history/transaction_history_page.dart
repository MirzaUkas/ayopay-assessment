import 'package:ayopay_assessment/app/extensions/number.dart';
import 'package:ayopay_assessment/presentation/pages/transaction_detail/transaction_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../app/config/color.dart';
import '../../../app/config/dimens.dart';
import '../../../app/config/typography.dart';
import '../../../domain/entities/payment_method_entity.dart';
import '../../../domain/entities/transaction_entity.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  final _transactions = [
    TransactionHistoryEntity(date: "Selasa, 01 Nov 2022", transactions: [
      TransactionEntity(
        name: "Top Up Saldo",
        paymentMethod: PaymentMethodEntity(
            provider: "Mandiri",
            icon: "assets/icons/ic_mandiri.png",
            steps: []),
        amount: 10000,
      ),
      TransactionEntity(
        name: "Top Up Saldo",
        paymentMethod: PaymentMethodEntity(
            provider: "Mandiri",
            icon: "assets/icons/ic_mandiri.png",
            steps: []),
        amount: 10000,
      ),
    ]),
    TransactionHistoryEntity(date: "Selasa, 05 Oct 2022", transactions: [
      TransactionEntity(
        name: "Top Up Saldo",
        paymentMethod: PaymentMethodEntity(
            provider: "Mandiri",
            icon: "assets/icons/ic_mandiri.png",
            steps: []),
        amount: 10000,
      ),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 12,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/ic_back.svg",
            width: 24,
            height: 24,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Riwayat Transaksi",
          style: AppTypography.title3.copyWith(
            color: AppColor.colorRed2A,
            fontSize: AppDimens.s18,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.s20,
          vertical: AppDimens.s30,
        ),
        child: ListView.builder(
          itemCount: _transactions.length,
          itemBuilder: (context, position) =>
              _transactionItem(_transactions[position]),
        ),
      ),
    );
  }

  Widget _transactionItem(TransactionHistoryEntity transaction) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          transaction.date,
          style: AppTypography.title1.copyWith(fontSize: AppDimens.s16),
        ),
        SizedBox(
          height: AppDimens.s24,
        ),
        ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, pos) => InkWell(
                  onTap: () => Get.to(() => TransactionDetailPage()),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/ic_card.svg",
                        color: AppColor.colorPrimary,
                      ),
                      SizedBox(
                        width: AppDimens.s16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  transaction.transactions[pos].name,
                                  style: AppTypography.body4,
                                ),
                                Text(
                                  transaction.transactions[pos].amount
                                      .toRupiah(),
                                  style: AppTypography.body5
                                      .copyWith(color: AppColor.colorSuccess),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: AppDimens.s2),
                              child: Text(
                                transaction
                                    .transactions[pos].paymentMethod.provider,
                                style: AppTypography.caption2
                                    .copyWith(color: AppColor.colorGrey8C),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
            separatorBuilder: (context, pos) => Divider(
                  color: AppColor.colorGreyDB,
                  thickness: 1,
                  indent: AppDimens.s48,
                ),
            itemCount: transaction.transactions.length),
        SizedBox(
          height: AppDimens.s32,
        )
      ],
    );
  }
}
