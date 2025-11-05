import 'package:get/get.dart';

// PAKAI PACKAGE IMPORT supaya tidak salah path
import 'package:belajar_flutter_getx/app/modules/home/home_view.dart';
import 'package:belajar_flutter_getx/app/modules/widget_dasar/widget_dasar_view.dart';
import 'package:belajar_flutter_getx/app/modules/state_management/state_management_view.dart';
import 'package:belajar_flutter_getx/app/modules/routing_navigasi/routing_navigasi_view.dart';
import 'package:belajar_flutter_getx/app/modules/tentang_getx/tentang_getx_view.dart';

class Routes {
  Routes._();
  static const home = '/';
  static const widgetDasar = '/widget-dasar';
  static const stateManagement = '/state-management';
  static const routingNavigasi = '/routing-navigasi';
  static const tentangGetx = '/tentang-getx';
}

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = <GetPage>[
    GetPage(name: Routes.home, page: () => HomeView()),
    GetPage(name: Routes.widgetDasar, page: () => WidgetDasarView()),
    GetPage(name: Routes.stateManagement, page: () => StateManagementView()),
    GetPage(name: Routes.routingNavigasi, page: () => RoutingNavigasiView()),
    GetPage(name: Routes.tentangGetx, page: () => TentangGetxView()),
  ];
}
