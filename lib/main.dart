import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibukos/core/controllers/kos_controller.dart';
import 'package:ibukos/ui/screens/splash_screen.dart';

void main() async {
  Get.put(KosController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ibukos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'NunitoSans',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
