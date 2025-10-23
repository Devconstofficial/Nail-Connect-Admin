import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nail_connect_admin/utils/app_colors.dart';
import 'package:nail_connect_admin/utils/app_constant_function.dart';
import 'package:nail_connect_admin/utils/app_images.dart';
import 'package:nail_connect_admin/utils/app_strings.dart';
import 'package:nail_connect_admin/utils/app_styles.dart';
import 'package:nail_connect_admin/views/screens/auth/controller/auth_controller.dart';
import '../../custom_widgets/custom_button.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends GetView<AuthController> {
  const OtpVerificationScreen({super.key});

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
                              'Verify OTP',
                              style: AppStyles.blackHeadingTextStyle(),
                            ),
                            SizedBox(height: getHeight(8)),
                            Text(
                              'Please enter the 5 digit code to confirm verification.',
                              style: AppStyles.blackSubheadingTextStyle(),
                            ),
                            SizedBox(height: getHeight(16)),
                            Pinput(
                              length: 6,
                              onChanged: (value) {
                                controller.code.value = value;
                              },
                              defaultPinTheme: PinTheme(
                                margin: EdgeInsets.symmetric(
                                  horizontal: getWidth(8),
                                ),
                                width: getWidth(56),
                                height: getHeight(56),
                                textStyle: AppStyles.otpTextStyle(),

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: kWhiteColor,
                                  border: Border.all(
                                    color: kContainerStroke,
                                    width: 2,
                                  ),
                                ),
                              ),
                              focusedPinTheme: PinTheme(
                                width: getWidth(56),
                                height: getHeight(56),
                                textStyle: AppStyles.otpTextStyle().copyWith(
                                  color: kBlack1Color,
                                ),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: kPrimaryColor,
                                    width: 2,
                                  ),
                                ),
                              ),
                              showCursor: true,
                            ),
                            SizedBox(height: getHeight(48)),
                            CustomButton(title: "Verify OTP", onTap: () {
                              Get.toNamed(kNewPasswordScreenRoute);
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
