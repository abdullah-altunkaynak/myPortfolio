import 'package:flutter/material.dart';
import 'package:flutter_myportfolio/ui/home_screen.dart';
import 'package:get/get.dart';
import 'controller/main_controller.dart';
import 'helpers/localization.g.dart';

void main() {
  Get.put(MainController());
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatefulWidget {
  const MyPortfolio({super.key});
  @override
  State<MyPortfolio> createState() => _MyPortfolioState();
}

class _MyPortfolioState extends State<MyPortfolio> {
  final MainController mainController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        translations: Localization(),
        locale: const Locale('tr'),
        debugShowCheckedModeBanner: false,
        title: 'Abdullah Altunkaynak',
        home: const HomeScreen());
  }
}
