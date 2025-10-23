import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nail_connect_admin/utils/app_colors.dart';
import 'package:nail_connect_admin/utils/app_constant_function.dart';
import 'package:nail_connect_admin/utils/app_images.dart';
import 'package:nail_connect_admin/utils/app_styles.dart';
import 'package:nail_connect_admin/views/custom_widgets/custom_textfield.dart';
import 'package:nail_connect_admin/views/screens/auth/controller/auth_controller.dart';

import '../../custom_widgets/custom_button.dart';

class NewPasswordScreen extends GetView<AuthController> {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(kLogo, width: getWidth(125)),
                  ),
                  const Spacer(),
                  Center(
                    child: Container(
                      width: getWidth(472),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Set New Password',
                              style: AppStyles.blackHeadingTextStyle(),
                            ),
                            SizedBox(height: getHeight(8)),
                            Text(
                              'Please enter your new password.',
                              style: AppStyles.blackSubheadingTextStyle(),
                            ),
                            SizedBox(height: getHeight(16)),
                            Text('New Password', style: AppStyles.labelTextStyle()),
                            SizedBox(height: getHeight(8)),
                            Obx(
                              () => CustomTextField(
                                hintText: "Create a secure password",
                                isObscure:
                                    controller.isObscureNewPass.value,
                                controller: controller.newPasswordController,
                                suffix: InkWell(
                                  onTap: () {
                                    controller.isObscureNewPass.value =
                                        !controller
                                            .isObscureNewPass
                                            .value;
                                  },
                                  child: Icon(
                                    controller.isObscureNewPass.value
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: kGreyColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: getHeight(24)),
                            Text('Confirm New Password', style: AppStyles.labelTextStyle()),
                            SizedBox(height: getHeight(8)),
                            Obx(
                              () => CustomTextField(
                                hintText: "Confirm New Password",
                                isObscure:
                                    controller.isObscureConfirmPass.value,
                                controller: controller.confirmNewPasswordController,
                                suffix: InkWell(
                                  onTap: () {
                                    controller.isObscureConfirmPass.value =
                                        !controller
                                            .isObscureConfirmPass
                                            .value;
                                  },
                                  child: Icon(
                                    controller.isObscureConfirmPass.value
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: kGreyColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            
                            SizedBox(height: getHeight(48)),
                            CustomButton(
                              title: "Update Password",
                              onTap: () {
                                Get.close(3);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            SizedBox(width: getWidth(30)),
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Image.asset(kSplashScreen, width: getHeight(820)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
