import 'package:ayopay_assessment/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/config/themes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightThemeData,
      home: const HomePage(),
    );
  }
}
