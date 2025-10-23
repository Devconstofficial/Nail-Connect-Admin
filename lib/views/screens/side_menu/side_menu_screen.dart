import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nail_connect_admin/utils/app_constant_function.dart';
import 'package:nail_connect_admin/utils/app_images.dart';
import 'package:nail_connect_admin/utils/app_styles.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../custom_widgets/custom_confirm_dialog.dart';
import 'controller/side_menu_controller.dart';

class SideMenuScreen extends StatefulWidget {
  const SideMenuScreen({super.key});

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  final menuController = Get.find<SideMenuController>();


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kWhiteColor,
      elevation: 0,
      width: getWidth(220),
      child: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          border: Border(
            right: BorderSide(color: kBlack1Color.withOpacity(0.2), width: 1),
          ),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getWidth(46),
                  vertical: getHeight(48),
                ),
                child: Image.asset(kLogo, fit: BoxFit.contain),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: getHeight(25)),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(0);
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      menuController.selectedIndex.value != 0
                                      ? EdgeInsetsGeometry.only(
                                          left: getWidth(28),
                                        )
                                      : EdgeInsetsGeometry.zero,
                                  child: Image.asset(
                                    menuController.selectedIndex.value == 0
                                        ? kDashboardActiveIcon
                                        : kDashboardInactiveIcon,
                                    height:
                                        menuController.selectedIndex.value == 0
                                        ? getHeight(57)
                                        : getHeight(24),
                                    width:
                                        menuController.selectedIndex.value == 0
                                        ? getWidth(53)
                                        : getWidth(24),
                                  ),
                                ),
                                SizedBox(width: getWidth(14)),
                                Text(
                                  'Dashboard',
                                  style: AppStyles.labelTextStyle().copyWith(
                                    color:
                                        menuController.selectedIndex.value == 0
                                        ? kPrimaryColor
                                        : kBlack1Color.withOpacity(0.5),
                                    fontWeight:
                                        menuController.selectedIndex.value == 0
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: getHeight(38)),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(1);
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      menuController.selectedIndex.value != 1
                                      ? EdgeInsetsGeometry.only(
                                          left: getWidth(28),
                                        )
                                      : EdgeInsetsGeometry.zero,
                                  child: Image.asset(
                                    menuController.selectedIndex.value == 1
                                        ? kUsersActiveIcon
                                        : kUsersInactiveIcon,
                                    height:
                                        menuController.selectedIndex.value == 1
                                        ? getHeight(57)
                                        : getHeight(24),
                                    width:
                                        menuController.selectedIndex.value == 1
                                        ? getWidth(53)
                                        : getWidth(24),
                                  ),
                                ),
                                SizedBox(width: getWidth(14)),
                                Text(
                                  'Users',
                                  style: AppStyles.labelTextStyle().copyWith(
                                    color:
                                        menuController.selectedIndex.value == 1
                                        ? kPrimaryColor
                                        : kBlack1Color.withOpacity(0.5),
                                    fontWeight:
                                        menuController.selectedIndex.value == 0
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: getHeight(38)),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(2);
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      menuController.selectedIndex.value != 2
                                      ? EdgeInsetsGeometry.only(
                                          left: getWidth(28),
                                        )
                                      : EdgeInsetsGeometry.zero,
                                  child: Image.asset(
                                    menuController.selectedIndex.value == 2
                                        ? kJobsActiveIcon
                                        : kJobsInactiveIcon,
                                    height:
                                        menuController.selectedIndex.value == 2
                                        ? getHeight(57)
                                        : getHeight(24),
                                    width:
                                        menuController.selectedIndex.value == 2
                                        ? getWidth(53)
                                        : getWidth(24),
                                  ),
                                ),
                                SizedBox(width: getWidth(14)),
                                Text(
                                  'Jobs',
                                  style: AppStyles.labelTextStyle().copyWith(
                                    color:
                                        menuController.selectedIndex.value == 2
                                        ? kPrimaryColor
                                        : kBlack1Color.withOpacity(0.5),
                                    fontWeight:
                                        menuController.selectedIndex.value == 0
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      SizedBox(height:getHeight(38)),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(3);
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      menuController.selectedIndex.value != 3
                                      ? EdgeInsetsGeometry.only(
                                          left: getWidth(28),
                                        )
                                      : EdgeInsetsGeometry.zero,
                                  child: Image.asset(
                                    menuController.selectedIndex.value == 3
                                        ? kReportsActiveIcon
                                        : kReportsInactiveIcon,
                                    height:
                                        menuController.selectedIndex.value == 3
                                        ? getHeight(57)
                                        : getHeight(24),
                                    width:
                                        menuController.selectedIndex.value == 3
                                        ? getWidth(53)
                                        : getWidth(24),
                                  ),
                                ),
                                SizedBox(width: getWidth(14)),
                                Text(
                                  'Reports',
                                  style: AppStyles.labelTextStyle().copyWith(
                                    color:
                                        menuController.selectedIndex.value == 3
                                        ? kPrimaryColor
                                        : kBlack1Color.withOpacity(0.5),
                                    fontWeight:
                                        menuController.selectedIndex.value == 0
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: getHeight(38)),
                      Obx(() {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              menuController.onItemTapped(4);
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      menuController.selectedIndex.value != 4
                                      ? EdgeInsetsGeometry.only(
                                          left: getWidth(28),
                                        )
                                      : EdgeInsetsGeometry.zero,
                                  child: Image.asset(
                                    menuController.selectedIndex.value == 4
                                        ? kSettingsActiveIcon
                                        : kSettingsInactiveIcon,
                                    height:
                                        menuController.selectedIndex.value == 4
                                        ? getHeight(57)
                                        : getHeight(24),
                                    width:
                                        menuController.selectedIndex.value == 4
                                        ? getWidth(53)
                                        : getWidth(24),
                                    color:
                                        menuController.selectedIndex.value == 4
                                        ? kPrimaryColor
                                        : kBlack1Color.withOpacity(0.5),
                                  ),
                                ),
                                SizedBox(width: getWidth(14)),
                                Text(
                                  'Settings',
                                  style: AppStyles.labelTextStyle().copyWith(
                                    color:
                                        menuController.selectedIndex.value == 4
                                        ? kPrimaryColor
                                        : kBlack1Color.withOpacity(0.5),
                                    fontWeight:
                                        menuController.selectedIndex.value == 0
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 38.0.h, left: 25.w),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => CustomConfirmDialog(
                          title: "Logout",
                          subtitle:
                              "Are you sure you want to log out of your account?",
                          iconPath: Icons.logout,
                          onConfirm: () {
                            Get.offAllNamed(kLoginScreenRoute);
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          width: getWidth(47),
                          height: getHeight(52),
                          decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(12),
                            child: Image.asset(kAdmin, fit: BoxFit.fill),
                          ),
                        ),
                        SizedBox(width: getWidth(14)),
                        Text(
                          'Easin Arafat',
                          style: AppStyles.labelTextStyle().copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: getWidth(14)),
                        Image.asset(
                          kLogoutIcon,
                          height: 24,
                          width: 24,
                          // color: kPrimaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
