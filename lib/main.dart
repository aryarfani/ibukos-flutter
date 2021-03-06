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
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          alwaysUse24HourFormat: true,
          textScaleFactor: 1.0,
        ),
        child: child,
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'NunitoSans',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
