import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nail_connect_admin/views/screens/jobs/jobs_screen.dart';
import 'package:nail_connect_admin/views/screens/reports/reports_screen.dart';
import 'package:nail_connect_admin/views/screens/settings/settings_screen.dart';
import 'package:nail_connect_admin/views/screens/side_menu/side_menu_screen.dart';
import 'package:nail_connect_admin/views/screens/users/users_screen.dart';
import '../../../utils/app_colors.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/side_menu/controller/side_menu_controller.dart';


class DashboardShell extends StatelessWidget {
  DashboardShell({super.key});
final SideMenuController menuController = Get.put(SideMenuController());


  final List<Widget> pages = const [
    DashboardScreen(),
    UsersScreen(),
    JobsScreen(),
    ReportsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Row(
        children: [
          const SideMenuScreen(),
          Expanded(
            child: Obx(() {
              return IndexedStack(
                index: menuController.selectedIndex.value,
                children: pages,
              );
            }),
          ),
        ],
      ),
    );
  }
}
