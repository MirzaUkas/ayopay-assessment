import 'package:ayopay_assessment/app/extensions/number.dart';
import 'package:ayopay_assessment/presentation/pages/top_up_method/top_up_method_detail_page.dart';
import 'package:ayopay_assessment/widgets/AnimatedToggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../app/config/color.dart';
import '../../../app/config/dimens.dart';
import '../../../app/config/typography.dart';

class TopUpMethodPage extends StatefulWidget {
  const TopUpMethodPage({Key? key}) : super(key: key);

  @override
  State<TopUpMethodPage> createState() => _TopUpMethodPageState();
}

class _TopUpMethodPageState extends State<TopUpMethodPage> {
  int? _amountValue = 1;
  int _toggleValue = 0;
  final List<double> _amounts = [10000, 20000, 50000, 100000, 200000, 500000];

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
                onToggleCallback: (value) {
                  setState(() {
                    _toggleValue = value;
                  });
                },
                backgroundColor: Colors.white,
                buttonColor: AppColor.colorPrimary,
              ),
              if (_toggleValue == 0)
                ..._instantMethod()
              else
                ..._otherMethod(),

            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _otherMethod() {
    return [
      Padding(
        padding: EdgeInsets.symmetric(vertical: AppDimens.s20),
        child: Text(
          "Pilih Metode",
          style: AppTypography.title1.copyWith(fontSize: AppDimens.s16),
        ),
      ),
      Container(
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
              style: AppTypography.body4.copyWith(color: AppColor.colorPrimary),
            ),
            SvgPicture.asset("assets/icons/ic_arrow_right.svg"),
          ],
        ),
      ),
      SizedBox(
        height: AppDimens.s20,
      ),
      Container(
        padding: EdgeInsets.symmetric(
            vertical: AppDimens.s14, horizontal: AppDimens.s18),
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.colorPrimary),
            borderRadius: const BorderRadius.all(const Radius.circular(8))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/icons/ic_phone.svg"),
            Text(
              "Internet / Mobile Banking",
              style: AppTypography.body4.copyWith(color: AppColor.colorPrimary),
            ),
            SvgPicture.asset("assets/icons/ic_arrow_right.svg"),
          ],
        ),
      )
    ];
  }

  List<Widget> _instantMethod() {
    return [
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
                _amounts[index].toRupiah(),
                style: AppTypography.caption1.copyWith(
                    color: _amountValue == index
                        ? Colors.white
                        : AppColor.colorGrey7C),
              ),
              selected: _amountValue == index,
              onSelected: (bool selected) {
                setState(() {
                  _amountValue = selected ? index : null;
                });
              },
            );
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
          onPressed: () => Get.to(() => TopUpMethodDetailPage()),
          style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
          child: const Text("Lanjut"),
        ),
      )
    ];
  }
}
