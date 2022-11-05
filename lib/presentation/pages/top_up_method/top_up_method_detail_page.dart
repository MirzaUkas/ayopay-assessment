import 'package:ayopay_assessment/domain/entities/payment_method_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/config/color.dart';
import '../../../app/config/dimens.dart';
import '../../../app/config/typography.dart';

class TopUpMethodDetailPage extends StatefulWidget {
  const TopUpMethodDetailPage({Key? key}) : super(key: key);

  @override
  State<TopUpMethodDetailPage> createState() => _TopUpMethodDetailPageState();
}

class _TopUpMethodDetailPageState extends State<TopUpMethodDetailPage> {
  final List<PaymentMethodEntity> _merchantMethods = [
    PaymentMethodEntity(
      provider: "Indomaret",
      steps: [],
      icon: "assets/icons/ic_indomaret.png",
    ),
    PaymentMethodEntity(
      provider: "Alfamart",
      steps: [],
      icon: "assets/icons/ic_alfamart.png",
    ),
  ];
  final List<PaymentMethodEntity> _bankingMethods = [
    PaymentMethodEntity(
      provider: "Livin",
      steps: [],
      icon: "assets/icons/ic_mandiri.png",
    ),
    PaymentMethodEntity(
      provider: "BNI Mobile",
      steps: [],
      icon: "assets/icons/ic_bni.png",
    ),
    PaymentMethodEntity(
      provider: "M-BCA",
      steps: [],
      icon: "assets/icons/ic_bca.png",
    ),
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
          "Metode Top Up",
          style: AppTypography.title3.copyWith(
            color: AppColor.colorRed2A,
            fontSize: AppDimens.s18,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(AppDimens.s30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppDimens.s20),
              child: Text(
                "Pilih Metode",
                style: AppTypography.title1.copyWith(fontSize: AppDimens.s16),
              ),
            ),
            _displayPaymentMethod(_bankingMethods)
            
          ],
        ),
      ),
    );
  }
  
  Widget _displayPaymentMethod(List<PaymentMethodEntity> methods) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, pos) => Padding(
          padding: EdgeInsets.symmetric(vertical: AppDimens.s18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(methods[pos].icon, width: 79,),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.s20),
                  child: Text(
                    methods[pos].provider,
                    style: AppTypography.title2
                        .copyWith(fontSize: AppDimens.s16),
                  ),
                ),
              ),
              SvgPicture.asset("assets/icons/ic_arrow_right.svg"),
            ],
          ),
        ),
        separatorBuilder: (context, pos) => const Divider(
          color: AppColor.colorGreyDB,
          thickness: 1,
        ),
        itemCount: methods.length);
  }
}
