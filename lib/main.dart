import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getlearn_app/data/controllers/home_controller.dart';
import 'package:getlearn_app/presentation/screens/home_screen.dart';
import 'package:getlearn_app/presentation/utility/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinding(),
      title: 'GetLearn',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
