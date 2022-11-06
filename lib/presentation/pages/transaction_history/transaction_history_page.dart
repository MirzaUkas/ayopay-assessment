import 'package:ayopay_assessment/app/extensions/number.dart';
import 'package:ayopay_assessment/presentation/pages/transaction_history/transaction_history_controller.dart';
import 'package:ayopay_assessment/presentation/pages/transaction_detail/transaction_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../app/config/color.dart';
import '../../../app/config/dimens.dart';
import '../../../app/config/typography.dart';
import '../../../domain/entities/transaction_entity.dart';
import '../../../widgets/loading_dialog.dart';

class TransactionHistoryPage extends GetView<TransactionHistoryController> {
  const TransactionHistoryPage({Key? key}) : super(key: key);

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
          onPressed: () => Get.back(),
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
        child: controller.obx(
            (state) => ListView.builder(
                  itemCount: state?.length,
                  itemBuilder: (context, position) =>
                      _transactionItem(state![position]),
                ),
            onError: (error) => Center(
                  child: Text(
                    error.toString(),
                    style: AppTypography.caption2,
                  ),
                ),
            onLoading: const LoadingDialog()),
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
                  onTap: () => Get.toNamed("transaction-detail",
                      arguments: {'id': transaction.transactions[pos].id}),
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
                                      .copyWith(color: transaction.transactions[pos].status ? AppColor.colorSuccess : AppColor.colorDanger),
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
