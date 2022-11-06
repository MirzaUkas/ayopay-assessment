import 'package:ayopay_assessment/app/extensions/number.dart';
import 'package:ayopay_assessment/app/util/constant.dart';
import 'package:ayopay_assessment/domain/entities/payment_method_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../app/config/color.dart';
import '../../../app/config/dimens.dart';
import '../../../app/config/typography.dart';
import '../../../widgets/loading_dialog.dart';
import 'top_up_method_detail_controller.dart';

class TopUpMethodDetailPage extends GetView<TopUpMethodDetailController> {
  const TopUpMethodDetailPage({Key? key}) : super(key: key);

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
            "Metode Top Up",
            style: AppTypography.title3.copyWith(
              color: AppColor.colorRed2A,
              fontSize: AppDimens.s18,
            ),
          ),
          centerTitle: true,
        ),
        body: controller.obx(
          (state) => Container(
            padding: EdgeInsets.all(AppDimens.s30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (Get.arguments['method'] == Constant.instantMethod)
                    _displaySummary(context, state ?? [])
                  else
                    ..._displayPaymentMethod(state ?? [])
                ],
              ),
            ),
          ),
          onError: (error) => Center(
            child: Text(
              error.toString(),
              style: AppTypography.caption2,
            ),
          ),
          onLoading: const LoadingDialog(),
        ));
  }

  Widget _displaySummary(
      BuildContext context, List<PaymentMethodEntity> methods) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text(
          "Jumlah Top Up",
          style: AppTypography.body4.copyWith(color: AppColor.colorGrey8C),
        ),
        TextField(
          controller: controller.controllerAmount,
          style: AppTypography.title1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: AppDimens.s8),
            hintText: "Minimal Rp10.000",
            hintStyle: AppTypography.title1,
          ),
        ),
        SizedBox(
          height: AppDimens.s10,
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
          height: AppDimens.s20,
        ),
        Text(
          "Rincian biaya top up",
          style: AppTypography.body4.copyWith(color: AppColor.colorGrey8C),
        ),
        SizedBox(
          height: AppDimens.s20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Jumlah top up",
              style: AppTypography.caption7.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: AppDimens.s11,
                  color: AppColor.colorGrey8C),
            ),
            Text(
              controller.controllerAmount.text,
              style: AppTypography.caption7.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: AppDimens.s11,
                  color: AppColor.colorBlack49),
            ),
          ],
        ),
        SizedBox(
          height: AppDimens.s16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Biaya top up",
              style: AppTypography.caption7.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: AppDimens.s11,
                  color: AppColor.colorGrey8C),
            ),
            InkWell(
              onTap: controller.groupValue == null
                  ? () => showModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            _bottomSheetInstantPayment(context, methods.first),
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                        ),
                      ).whenComplete(() => controller.update())
                  : null,
              child: Text(
                controller.groupValue != null
                    ? methods.first.fee.toRupiah()
                    : "Pilih Metode Pembayaran",
                style: AppTypography.caption7.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: AppDimens.s11,
                    color: controller.groupValue != null
                        ? AppColor.colorBlack49
                        : AppColor.colorSuccess),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
        ),
        ElevatedButton(
          onPressed: controller.groupValue != null
              ? () => controller.topUp(true).then((value) {
                    Get.offNamed("transaction-detail",
                        arguments: {'id': value?.id});
                  })
              : null,
          style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
          child: const Text("Top Up Sekarang"),
        )
      ],
    );
  }

  List<Widget> _displayPaymentMethod(List<PaymentMethodEntity> methods) {
    return [
      Padding(
        padding: EdgeInsets.symmetric(vertical: AppDimens.s20),
        child: Text(
          "Pilih Metode",
          style: AppTypography.title1.copyWith(fontSize: AppDimens.s16),
        ),
      ),
      ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, pos) => InkWell(
                onTap: () => {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        _bottomSheetSteps(context, methods[pos].steps),
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                  )
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: AppDimens.s18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        methods[pos].icon,
                        width: 79,
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: AppDimens.s20),
                          child: Text(
                            methods[pos].displayName,
                            style: AppTypography.title2
                                .copyWith(fontSize: AppDimens.s16),
                          ),
                        ),
                      ),
                      SvgPicture.asset("assets/icons/ic_arrow_right.svg"),
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, pos) => const Divider(
                color: AppColor.colorGreyDB,
                thickness: 1,
              ),
          itemCount: methods.length)
    ];
  }

  Widget _bottomSheetSteps(BuildContext context, List<String> steps) {
    return Padding(
      padding: EdgeInsets.all(AppDimens.s16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Cara pembayaran",
              style: AppTypography.title1.copyWith(fontSize: AppDimens.s16),
            ),
            SizedBox(
              height: AppDimens.s30,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, pos) => Container(
                margin: EdgeInsets.only(bottom: AppDimens.s8),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/ic_bullet.svg"),
                    SizedBox(
                      width: AppDimens.s8,
                    ),
                    Flexible(
                      child: Text(
                        steps[pos],
                        maxLines: 2,
                        style: AppTypography.caption2
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              itemCount: steps.length,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomSheetInstantPayment(
      BuildContext context, PaymentMethodEntity payment) {
    return StatefulBuilder(
        builder: (context, setState) => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppDimens.s30,
                  horizontal: AppDimens.s16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppDimens.s16),
                      child: Text(
                        "Pilih Metode Pembayaran",
                        style: AppTypography.title3
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: AppDimens.s30,
                    ),
                    ListTile(
                      leading: Image.network(
                        payment.icon,
                        width: 78,
                      ),
                      title: Text(
                        payment.displayName,
                        style: AppTypography.body4.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColor.colorBlack49,
                        ),
                      ),
                      trailing: Radio<int>(
                        value: payment.id,
                        toggleable: true,
                        groupValue: controller.groupValue,
                        onChanged: (int? value) {
                          controller.selectInstantPayment(value!);
                          setState(() {});
                        },
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: Image.network(
                        payment.icon,
                        width: 78,
                      ),
                      title: Text(
                        payment.displayName,
                        style: AppTypography.body4.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColor.colorBlack49,
                        ),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () => Get.back(),
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: EdgeInsets.symmetric(vertical: AppDimens.s4),
                          minimumSize: const Size(100, 25),
                        ),
                        child: const Text("Tambah"),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
