import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nail_connect_admin/utils/app_colors.dart';
import 'package:nail_connect_admin/utils/app_constant_function.dart';
import 'package:nail_connect_admin/utils/app_images.dart';
import 'package:nail_connect_admin/utils/app_strings.dart';
import 'package:nail_connect_admin/utils/app_styles.dart';
import 'package:nail_connect_admin/views/custom_widgets/custom_textfield.dart';
import 'package:nail_connect_admin/views/screens/auth/controller/auth_controller.dart';
import '../../custom_widgets/custom_button.dart';

class ForgotPasswordScreen extends GetView<AuthController> {
  const ForgotPasswordScreen({super.key});

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
                              'Forgot Password?',
                              style: AppStyles.blackHeadingTextStyle(),
                            ),
                            SizedBox(height: getHeight(8)),
                            Text(
                              'Please enter your email to reset your password.',
                              style: AppStyles.blackSubheadingTextStyle(),
                            ),
                            SizedBox(height: getHeight(16)),
                            Text('Email', style: AppStyles.labelTextStyle()),
                            SizedBox(height: getHeight(8)),
                            CustomTextField(
                              hintText: 'Enter Email Address',
                              controller: controller.emailController,
                              textInputType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: getHeight(48)),
                            CustomButton(title: "Submit", onTap: () {
                              Get.toNamed(kVerifyOtpScreenRoute);
                            }),
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
