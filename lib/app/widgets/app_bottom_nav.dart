import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajar_flutter_getx/app/routes/app_pages.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  const AppBottomNav({super.key, required this.currentIndex});

  void _go(int i) {
    switch (i) {
      case 0:
        Get.offNamedUntil(Routes.home, (r) => false);
        break;
      case 1:
        Get.offNamed(Routes.widgetDasar);
        break;
      case 2:
        Get.offNamed(Routes.stateManagement);
        break;
      case 3:
        Get.offNamed(Routes.routingNavigasi);
        break;
      case 4:
        Get.offNamed(Routes.tentangGetx);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: _go,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.widgets), label: 'Widget'),
        BottomNavigationBarItem(
          icon: Icon(Icons.manage_accounts),
          label: 'State',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.alt_route), label: 'Routing'),
        BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: 'GetX'),
      ],
    );
  }
}
