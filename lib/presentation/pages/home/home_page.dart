import 'package:ayopay_assessment/presentation/pages/top_up_method/top_up_method_page.dart';
import 'package:ayopay_assessment/presentation/pages/transaction_history/transaction_history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../app/config/color.dart';
import '../../../app/config/dimens.dart';
import '../../../app/config/typography.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 12,
        title: Text(
          "Home",
          style: AppTypography.title3.copyWith(
            color: AppColor.colorRed2A,
            fontSize: AppDimens.s18,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => _bottomSheetContent(context),
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
            );
          },
          child: const Text("MENU"),
        ),
      ),
    );
  }

  Widget _bottomSheetContent(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              vertical: AppDimens.s28, horizontal: AppDimens.s30),
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColor.colorPurpleB7,
              AppColor.colorPurpleAD,
            ]),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(AppDimens.s16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        SvgPicture.asset("assets/icons/ic_wallet.svg"),
                        Text(
                          "Saldo",
                          style: AppTypography.body1
                              .copyWith(fontSize: AppDimens.s12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimens.s4,
                    ),
                    Text(
                      "Rp20.000",
                      style:
                          AppTypography.body4.copyWith(fontSize: AppDimens.s20),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed("transaction-history");
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/icons/ic_document.svg"),
                    Text(
                      "Riwayat",
                      style: AppTypography.body1.copyWith(
                        fontSize: AppDimens.s12,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () => Get.toNamed('payment'),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/icons/ic_card.svg"),
                    Text(
                      "Top Up",
                      style: AppTypography.body1.copyWith(
                        fontSize: AppDimens.s12,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(AppDimens.s30),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/icons/ic_user.svg"),
                  SizedBox(width: AppDimens.s36),
                  Text(
                    "Ubah Profile",
                    style: AppTypography.body1.copyWith(),
                  )
                ],
              ),
              SizedBox(
                height: AppDimens.s20,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/ic_lock.svg"),
                  SizedBox(width: AppDimens.s36),
                  Text(
                    "Privasi",
                    style: AppTypography.body1.copyWith(),
                  )
                ],
              ),
              SizedBox(
                height: AppDimens.s20,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/ic_security.svg"),
                  SizedBox(width: AppDimens.s36),
                  Text(
                    "Keamanan",
                    style: AppTypography.body1.copyWith(),
                  )
                ],
              ),
              SizedBox(
                height: AppDimens.s20,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/ic_people.svg"),
                  SizedBox(width: AppDimens.s36),
                  Text(
                    "Pengguna",
                    style: AppTypography.body1.copyWith(),
                  )
                ],
              ),
              SizedBox(
                height: AppDimens.s20,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/ic_information.svg"),
                  SizedBox(width: AppDimens.s36),
                  Text(
                    "Tentang",
                    style: AppTypography.body1.copyWith(),
                  )
                ],
              ),
              SizedBox(
                height: AppDimens.s20,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/ic_out.svg"),
                  SizedBox(width: AppDimens.s36),
                  Text(
                    "Keluar",
                    style: AppTypography.body1.copyWith(),
                  )
                ],
              ),
              SizedBox(
                height: AppDimens.s20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
