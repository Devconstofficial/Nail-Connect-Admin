import 'package:get/get.dart';
import 'package:nail_connect_admin/views/screens/dashboard/controller/dashboard_controller.dart';
import 'package:nail_connect_admin/views/screens/jobs/controller/jobs_controller.dart';
import 'package:nail_connect_admin/views/screens/reports/controller/reports_controller.dart';
import 'package:nail_connect_admin/views/screens/settings/controller/settings_controller.dart';
import 'package:nail_connect_admin/views/screens/side_menu/controller/side_menu_controller.dart';
import 'package:nail_connect_admin/views/screens/users/controller/users_controller.dart';

import '../views/screens/auth/controller/auth_controller.dart';


class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => UsersController());
    Get.lazyPut(() => ReportsController());
    Get.lazyPut(() => JobsController());
    Get.lazyPut(() => SettingsController());
    Get.lazyPut(() => SideMenuController());
    Get.lazyPut(() => DashboardController());
  }
}
