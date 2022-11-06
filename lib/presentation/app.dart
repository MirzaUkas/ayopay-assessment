import 'package:ayopay_assessment/presentation/pages/top_up_method/top_up_method_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/config/themes.dart';
import 'pages/home/home_page.dart';
import 'pages/top_up_method/top_up_method_binding.dart';
import 'pages/top_up_method_detail/top_up_method_detail_binding.dart';
import 'pages/top_up_method_detail/top_up_method_detail_page.dart';
import 'pages/transaction_detail/transaction_detail_binding.dart';
import 'pages/transaction_detail/transaction_detail_page.dart';
import 'pages/transaction_history/transaction_history_binding.dart';
import 'pages/transaction_history/transaction_history_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => const HomePage(),
          binding: TransactionHistoryBinding(),
        ),
        GetPage(
          name: "/transaction-history",
          page: () => const TransactionHistoryPage(),
          binding: TransactionHistoryBinding(),
        ),
        GetPage(
          name: "/transaction-detail",
          page: () => const TransactionDetailPage(),
          binding: TransactionDetailBinding(),
        ),
        GetPage(
          name: "/payment",
          page: () => const TopUpMethodPage(),
          binding: TopUpMethodBinding(),
        ),
        GetPage(
            name: "/payment-detail",
            page: () => const TopUpMethodDetailPage(),
            binding: TopUpMethodDetailBinding()),
      ],
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightThemeData,
    );
  }
}
