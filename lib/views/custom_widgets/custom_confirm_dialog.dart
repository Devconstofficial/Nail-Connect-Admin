import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constant_function.dart';
import '../../utils/app_styles.dart';
import 'custom_button.dart';

class CustomConfirmDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconPath;
  final VoidCallback onConfirm;

  const CustomConfirmDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        backgroundColor: kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          width: 400.w, 
          height: 350.h, 
          child: Padding(
            padding: EdgeInsets.all(getWidth(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(
                      Icons.close,
                      color: kBlack1Color,
                      size: 24,
                    ),
                  ),
                ),
                SizedBox(height: getHeight(8)),
                Icon(
                  iconPath,
                  size: 40,
                  color: kPrimaryColor,
                ),
                SizedBox(height: getHeight(16)),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppStyles.blackHeadingTextStyle().copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: getHeight(10)),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: AppStyles.blackSubheadingTextStyle().copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomButton(
                        title: "Cancel",
                        onTap: () => Get.back(),
                        borderColor: kBlack1Color.withOpacity(0.2),
                        borderRadius: 15,
                        colors: [kWhiteColor, kWhiteColor],
                        textColor: kBlack1Color,
                        textSize: 15,
                      ),
                    ),
                    SizedBox(width: getWidth(16)),
                    Expanded(
                      child: CustomButton(
                        title: "Yes",
                        onTap: onConfirm,
                        borderRadius: 15,
                        textColor: kWhiteColor,
                        textSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
