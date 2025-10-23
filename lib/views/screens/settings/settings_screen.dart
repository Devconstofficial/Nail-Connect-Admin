import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nail_connect_admin/utils/app_colors.dart';
import 'package:nail_connect_admin/utils/app_constant_function.dart';
import 'package:nail_connect_admin/utils/app_images.dart';
import 'package:nail_connect_admin/utils/app_styles.dart';
import 'package:nail_connect_admin/views/custom_widgets/custom_button.dart';
import 'package:nail_connect_admin/views/custom_widgets/custom_textfield.dart';
import 'package:nail_connect_admin/views/screens/settings/controller/settings_controller.dart';

import '../../custom_widgets/base_layout.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      headerTitle: "Settings",
      children: [
        Text(
          'Settings',
          style: AppStyles.otpTextStyle().copyWith(fontSize: 24.sp),
        ),
        SizedBox(height: getHeight(36)),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(24),
            vertical: getHeight(16),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),

            boxShadow: [
              BoxShadow(
                color: kBlackColor.withOpacity(0.07),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: getWidth(30),
                    backgroundImage: AssetImage(kUser2),
                  ),
                  SizedBox(width: getWidth(22)),
                  CustomButton(
                    width: 98,
                    height: 40,
                    borderRadius: 6,
                    borderColor: kPrimaryColor,
                    colors: [kWhiteColor, kWhiteColor],
                    textColor: kPrimaryColor,
                    textSize: 16,
                    title: "Update",
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: getHeight(16)),
              Padding(
                padding: EdgeInsets.only(left: getWidth(60)),
                child: Row(
                  children: [
                    Text('Name', style: AppStyles.labelTextStyle()),
                    SizedBox(width: getWidth(10)),
                    SizedBox(
                      width: 489,
                      child: CustomTextField(
                        hintText: 'Enter Name',
                        controller: controller.name,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getHeight(16)),
              Row(
                children: [
                  Text('Commission%', style: AppStyles.labelTextStyle()),
                  SizedBox(width: getWidth(10)),
                  SizedBox(
                    width: 489,
                    child: CustomTextField(
                      hintText: 'Enter Commission',
                      controller: controller.commission,
                    ),
                  ),
                ],
              ),
              SizedBox(height: getHeight(16)),
              Align(
                alignment: Alignment.bottomRight,
                child: CustomButton(
                    width: 118,
                    height: 40,
                    borderRadius: 6,
                    textSize: 15,
                    title: "Save Settings",
                    onTap: () {},
                  ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
