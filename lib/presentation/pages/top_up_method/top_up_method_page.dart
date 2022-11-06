import 'package:ayopay_assessment/app/extensions/number.dart';
import 'package:ayopay_assessment/presentation/pages/top_up_method/top_up_method_controller.dart';
import 'package:ayopay_assessment/widgets/AnimatedToggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../app/config/color.dart';
import '../../../app/config/dimens.dart';
import '../../../app/config/typography.dart';
import '../../../app/util/constant.dart';

class TopUpMethodPage extends GetView<TopUpMethodController> {
  const TopUpMethodPage({Key? key}) : super(key: key);

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
          "Metode Top Up",
          style: AppTypography.title3.copyWith(
            color: AppColor.colorRed2A,
            fontSize: AppDimens.s18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(AppDimens.s30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedToggle(
                values: ["Instan", "Metode Lain"],
                onToggleCallback: (value) => controller.setToggle(value),
                backgroundColor: Colors.white,
                buttonColor: AppColor.colorPrimary,
              ),
              Obx(() => controller.toggleValue.value == 0
                  ? _instantMethod()
                  : _otherMethod())
            ],
          ),
        ),
      ),
    );
  }

  Widget _otherMethod() {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppDimens.s20),
          child: Text(
            "Pilih Metode",
            style: AppTypography.title1.copyWith(fontSize: AppDimens.s16),
          ),
        ),
        InkWell(
          onTap: () => Get.toNamed(
            "payment-detail",
            arguments: {'method': Constant.merchantMethod},
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: AppDimens.s14, horizontal: AppDimens.s18),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.colorPrimary),
                borderRadius: const BorderRadius.all(const Radius.circular(8))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/icons/ic_merchant.svg"),
                Text(
                  "Indomaret / Alfamart",
                  style: AppTypography.body4
                      .copyWith(color: AppColor.colorPrimary),
                ),
                SvgPicture.asset("assets/icons/ic_arrow_right.svg"),
              ],
            ),
          ),
        ),
        SizedBox(
          height: AppDimens.s20,
        ),
        InkWell(
          onTap: () => Get.toNamed(
            "payment-detail",
            arguments: {'method': Constant.bankingMethod},
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: AppDimens.s14, horizontal: AppDimens.s18),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.colorPrimary),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/icons/ic_phone.svg"),
                Text(
                  "Internet / Mobile Banking",
                  style: AppTypography.body4
                      .copyWith(color: AppColor.colorPrimary),
                ),
                SvgPicture.asset("assets/icons/ic_arrow_right.svg"),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _instantMethod() {
    return ListView(shrinkWrap: true, children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: AppDimens.s20),
        child: Text(
          "Pilih Nominal Top Up",
          style: AppTypography.title1.copyWith(fontSize: AppDimens.s16),
        ),
      ),
      Wrap(
        spacing: AppDimens.s18,
        runSpacing: AppDimens.s18,
        children: List<Widget>.generate(
          6,
          (int index) {
            return ChoiceChip(
                padding: EdgeInsets.symmetric(
                    vertical: AppDimens.s8, horizontal: AppDimens.s16),
                selectedColor: AppColor.colorPrimary,
                label: Text(
                  controller.amounts[index].toRupiah(),
                  style: AppTypography.caption1.copyWith(
                      color: controller.amountIndex.value == index
                          ? Colors.white
                          : AppColor.colorGrey7C),
                ),
                selected: controller.amountIndex.value == index,
                onSelected: (bool selected) =>
                    controller.setChipAmount(selected ? index : 0));
          },
        ).toList(),
      ),
      SizedBox(
        height: AppDimens.s20,
      ),
      Text(
        "Atau masukan nominal top up disini",
        style: AppTypography.caption4.copyWith(color: AppColor.colorGrey86),
      ),
      SizedBox(
        height: AppDimens.s10,
      ),
      TextField(
        controller: controller.controllerAmount,
        style: AppTypography.caption4,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: AppDimens.s20, vertical: AppDimens.s8),
          hintText: "Minimal Rp10.000",
          hintStyle: AppTypography.caption4,
          filled: true,
          fillColor: AppColor.colorGreyE8,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
      ),
      SizedBox(
        height: AppDimens.s48,
      ),
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => Get.toNamed("payment-detail", arguments: {
            'method': Constant.instantMethod,
            'amount': controller.getSelectedAmount()
          }),
          style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
          child: const Text("Lanjut"),
        ),
      )
    ]);
  }
}
