import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nail_connect_admin/utils/app_colors.dart';
import 'package:nail_connect_admin/utils/app_constant_function.dart';
import 'package:nail_connect_admin/utils/app_images.dart';
import 'package:nail_connect_admin/utils/app_styles.dart';
import 'package:nail_connect_admin/views/custom_widgets/custom_textfield.dart';
import 'package:nail_connect_admin/views/custom_widgets/routing.dart';
import 'package:nail_connect_admin/views/screens/auth/controller/auth_controller.dart';

import '../../../utils/app_strings.dart';
import '../../custom_widgets/custom_button.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

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
                              'Welcome Back 👋',
                              style: AppStyles.blackHeadingTextStyle(),
                            ),
                            SizedBox(height: getHeight(8)),
                            Text(
                              'Sign in to manage businesses, professionals, and job postings.',
                              style: AppStyles.blackSubheadingTextStyle(),
                            ),
                            SizedBox(height: getHeight(16)),
                            Text('Email', style: AppStyles.labelTextStyle()),
                            SizedBox(height: getHeight(8)),
                            CustomTextField(
                              hintText: 'Enter Email Address',
                              controller: controller.emailLogin,
                              textInputType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: getHeight(24)),
                            Text('Password', style: AppStyles.labelTextStyle()),
                            SizedBox(height: getHeight(8)),
                            Obx(
                              () => CustomTextField(
                                hintText: "Enter Password",
                                isObscure:
                                    controller.isPasswordLoginVisible.value,
                                controller: controller.passwordLogin,
                                suffix: InkWell(
                                  onTap: () {
                                    controller.isPasswordLoginVisible.value =
                                        !controller
                                            .isPasswordLoginVisible
                                            .value;
                                  },
                                  child: Icon(
                                    controller.isPasswordLoginVisible.value
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: kGreyColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: getHeight(24)),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(kForgotPasswordScreenRoute);
                              },
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "Forgot Password?",
                                  style: AppStyles.inputTextStyle().copyWith(
                                    color: kPrimaryColor,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: getHeight(24)),
                            CustomButton(
                              title: "Sign In",
                              onTap: () {
                                // Get.toNamed(kDashboardScreenRoute);
                                Get.offAll(() => DashboardShell());

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
