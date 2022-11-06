import 'package:ayopay_assessment/app/extensions/number.dart';
import 'package:ayopay_assessment/domain/entities/transaction_entity.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../app/config/color.dart';
import '../../../app/config/dimens.dart';
import '../../../app/config/typography.dart';
import '../../../widgets/loading_dialog.dart';
import 'transaction_detail_controller.dart';

class TransactionDetailPage extends GetView<TransactionDetailController> {
  const TransactionDetailPage({Key? key}) : super(key: key);

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
          "Rincian Transaksi",
          style: AppTypography.title3.copyWith(
            color: AppColor.colorRed2A,
            fontSize: AppDimens.s18,
          ),
        ),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => ListView(
          children: [
            if (state!.status)
              ..._successTransaction(state)
            else
              ..._failedTransaction(state),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppDimens.s48, vertical: AppDimens.s48),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                child: const Text("Tutup"),
              ),
            )
          ],
        ),
        onError: (error) => Center(
          child: Text(
            error.toString(),
            style: AppTypography.caption2,
          ),
        ),
        onLoading: const LoadingDialog(),
      ),
    );
  }

  List<Widget> _successTransaction(TransactionEntity transaction) {
    return [
      SizedBox(
        height: AppDimens.s30,
      ),
      SvgPicture.asset(
        "assets/icons/ic_success.svg",
      ),
      SizedBox(
        height: AppDimens.s12,
      ),
      Text(
        "Berhasil",
        textAlign: TextAlign.center,
        style: AppTypography.body4.copyWith(color: AppColor.colorSuccess),
      ),
      Text(
        transaction.amount.toRupiah(),
        textAlign: TextAlign.center,
        style: AppTypography.title1,
      ),
      SizedBox(
        height: AppDimens.s8,
      ),
      Wrap(
        alignment: WrapAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/ic_card.svg",
            width: 24,
            height: 24,
            color: AppColor.colorPrimary,
          ),
          SizedBox(
            width: AppDimens.s8,
          ),
          Text(
            transaction.name,
            style: AppTypography.body4,
          )
        ],
      ),
      SizedBox(
        height: AppDimens.s24,
      ),
      Text(
        "Saldo Berhasil Masuk",
        textAlign: TextAlign.center,
        style: AppTypography.body4.copyWith(color: AppColor.colorSuccess),
      ),
      SizedBox(
        height: AppDimens.s30,
      ),
      const Divider(
        color: AppColor.colorGreyDB,
        thickness: 5,
      ),
      Container(
        padding: EdgeInsets.only(
            left: AppDimens.s20,
            right: AppDimens.s20,
            top: AppDimens.s20,
            bottom: AppDimens.s48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  transaction.paymentMethod.icon,
                  width: 70,
                  height: 31,
                ),
                const Spacer(),
                Text(
                  transaction.paymentMethod.provider,
                  style: AppTypography.body5
                      .copyWith(color: AppColor.colorBlack49),
                ),
                const Spacer(),
              ],
            ),
            const Divider(
              color: AppColor.colorGreyDB,
              thickness: 1,
            ),
            Padding(
                padding:
                    EdgeInsets.only(top: AppDimens.s20, bottom: AppDimens.s12),
                child: Text(
                  "Detail Transaksi",
                  style: AppTypography.title2,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Masuk ke Saldo",
                  style: AppTypography.caption7
                      .copyWith(color: AppColor.colorGrey8C),
                ),
                Text(
                  transaction.amount.toRupiah(),
                  style: AppTypography.caption7
                      .copyWith(color: AppColor.colorBlack49),
                ),
              ],
            ),
            SizedBox(
              height: AppDimens.s12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tanggal",
                  style: AppTypography.caption7
                      .copyWith(color: AppColor.colorGrey8C),
                ),
                Text(
                  transaction.date,
                  style: AppTypography.caption7
                      .copyWith(color: AppColor.colorBlack49),
                ),
              ],
            ),
            SizedBox(
              height: AppDimens.s12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Waktu",
                  style: AppTypography.caption7
                      .copyWith(color: AppColor.colorGrey8C),
                ),
                Text(
                  transaction.time,
                  style: AppTypography.caption7
                      .copyWith(color: AppColor.colorBlack49),
                ),
              ],
            ),
            SizedBox(
              height: AppDimens.s12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "No.Referensi",
                  style: AppTypography.caption7
                      .copyWith(color: AppColor.colorGrey8C),
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      transaction.referenceCode,
                      style: AppTypography.caption7
                          .copyWith(color: AppColor.colorBlack49),
                    ),
                    SvgPicture.asset("assets/icons/ic_copy.svg")
                  ],
                )
              ],
            ),
            SizedBox(
              height: AppDimens.s12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nominal Top Up",
                  style: AppTypography.caption7
                      .copyWith(color: AppColor.colorGrey8C),
                ),
                Text(
                  transaction.amount.toRupiah(),
                  style: AppTypography.caption7
                      .copyWith(color: AppColor.colorBlack49),
                ),
              ],
            ),
            SizedBox(
              height: AppDimens.s12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Biaya Top Up",
                  style: AppTypography.caption7
                      .copyWith(color: AppColor.colorGrey8C),
                ),
                Text(
                  transaction.fee.toRupiah(),
                  style: AppTypography.caption7
                      .copyWith(color: AppColor.colorBlack49),
                ),
              ],
            ),
            SizedBox(
              height: AppDimens.s16,
            ),
            const DottedLine(
              dashColor: AppColor.colorGrey8C,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppDimens.s12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: AppTypography.caption2
                        .copyWith(color: AppColor.colorBlack49),
                  ),
                  Text(
                    transaction.total.toRupiah(),
                    style: AppTypography.caption2
                        .copyWith(color: AppColor.colorBlack49),
                  ),
                ],
              ),
            ),
            const DottedLine(
              dashColor: AppColor.colorGrey8C,
            ),
          ],
        ),
      ),
      const Divider(
        color: AppColor.colorGreyDB,
        thickness: 5,
      ),
    ];
  }

  List<Widget> _failedTransaction(TransactionEntity transaction) {
    return [
      SizedBox(
        height: AppDimens.s56,
      ),
      SvgPicture.asset(
        "assets/icons/ic_failed.svg",
      ),
      SizedBox(
        height: AppDimens.s12,
      ),
      Text(
        "Gagal",
        textAlign: TextAlign.center,
        style: AppTypography.body4.copyWith(color: AppColor.colorDanger),
      ),
      Text(
        transaction.amount.toRupiah(),
        textAlign: TextAlign.center,
        style: AppTypography.title1,
      ),
      Wrap(
        alignment: WrapAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/ic_card.svg",
            width: 24,
            height: 24,
            color: AppColor.colorPrimary,
          ),
          SizedBox(
            width: AppDimens.s8,
          ),
          Text(
            transaction.name,
            style: AppTypography.body4,
          )
        ],
      ),
      SizedBox(
        height: AppDimens.s24,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.s56),
        child: Text(
          "Tenang saja walaupun gagal saldo kakak/adik tidak akan berkurang",
          style: AppTypography.body5,
          textAlign: TextAlign.center,
        ),
      ),
    ];
  }
}
