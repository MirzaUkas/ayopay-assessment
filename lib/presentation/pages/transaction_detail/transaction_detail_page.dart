import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/config/color.dart';
import '../../../app/config/dimens.dart';
import '../../../app/config/typography.dart';

class TransactionDetailPage extends StatefulWidget {
  const TransactionDetailPage({Key? key}) : super(key: key);

  @override
  State<TransactionDetailPage> createState() => _TransactionDetailPageState();
}

class _TransactionDetailPageState extends State<TransactionDetailPage> {
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
          "Rincian Transaksi",
          style: AppTypography.title3.copyWith(
            color: AppColor.colorRed2A,
            fontSize: AppDimens.s18,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ..._successTransaction(),
          // ..._failedTransaction(),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppDimens.s48, vertical: AppDimens.s48),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
              child: const Text("Tutup"),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _successTransaction() {
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
        "Rp10.000",
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
            "Top Up Saldo",
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
                Image.asset(
                  "assets/icons/ic_one_klik.png",
                  width: 70,
                  height: 31,
                ),
                const Spacer(),
                Text(
                  "BCA One Klik",
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
                  "Rp20.000",
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
                  "01 Nov 2022",
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
                  "13.13",
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
                      "ABC23123123",
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
                  "Rp10.000",
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
                  "Rp1.000",
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
                    "Rp11.000",
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

  List<Widget> _failedTransaction() {
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
        "Rp10.000",
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
            "Top Up Saldo",
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
