import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajar_flutter_getx/app/routes/app_pages.dart';

void main() {
  runApp(const BelajarFlutterApp());
}

class BelajarFlutterApp extends StatelessWidget {
  const BelajarFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aplikasi Belajar Flutter',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
    );
  }
}
