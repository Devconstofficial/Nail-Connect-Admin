import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nail_connect_admin/utils/app_images.dart';
import 'package:nail_connect_admin/views/custom_widgets/custom_button.dart';
import 'package:nail_connect_admin/views/custom_widgets/custom_textfield_2.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constant_function.dart';
import '../../utils/app_styles.dart';

class BusinessDetailsView extends StatelessWidget {
  BusinessDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: getWidth(20)),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(getWidth(16)),
      ),
      child: SizedBox(
        width: 400.w,
        height: 900.h,
        child: Padding(
          padding: EdgeInsets.all(getWidth(24)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Business Details",
                      style: AppStyles.buttonTextStyle().copyWith(
                        fontWeight: FontWeight.w600,
                        color: kBlack1Color,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: CircleAvatar(
                        radius: getWidth(16),
                        backgroundColor: kPrimaryColor.withOpacity(0.08),
                        child: Icon(
                          Icons.close,
                          color: kPrimaryColor,
                          size: getWidth(18),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getHeight(32)),

                Center(
                  child: CircleAvatar(
                    radius: getWidth(50),
                    backgroundImage: AssetImage(kNotification2),
                  ),
                ),

                SizedBox(height: getHeight(32)),

                Text(
                  'Business Name',
                  style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp),
                ),
                SizedBox(height: getHeight(8)),
                CustomTextField2(
                  hintText: 'John Doe',
                  controller: TextEditingController(text: 'John Doe'),
                  readOnly: false,
                ),
                SizedBox(height: getHeight(16)),
                Text(
                  'Business Type',
                  style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp),
                ),
                SizedBox(height: getHeight(8)),
                Container(
                  width: getWidth(151),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'Beauty Retails Store',
                      style: AppStyles.inputTextStyle().copyWith(
                        color: kPrimaryColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: getHeight(16)),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Business Email',
                            style: AppStyles.labelTextStyle().copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(height: getHeight(8)),
                          CustomTextField2(
                            hintText: 'example@gmail.com',
                            controller: TextEditingController(
                              text: 'example@gmail.com',
                            ),
                            readOnly: false,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: getWidth(16)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Business Phone Number',
                            style: AppStyles.labelTextStyle().copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(height: getHeight(8)),
                          CustomTextField2(
                            hintText: '3375005467',
                            controller: TextEditingController(
                              text: '1234567890',
                            ),
                            readOnly: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getHeight(16)),

                Text(
                  'Address',
                  style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp),
                ),
                SizedBox(height: getHeight(8)),
                CustomTextField2(
                  hintText: '132 Street abc town',
                  controller: TextEditingController(
                    text: '132 Street abc town',
                  ),
                  readOnly: false,
                ),

                SizedBox(height: getHeight(16)),

                Text(
                  'City',
                  style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp),
                ),
                SizedBox(height: getHeight(8)),
                CustomTextField2(
                  hintText: 'Downtown',
                  controller: TextEditingController(text: 'Downtown'),
                  readOnly: false,
                ),
                SizedBox(height: getHeight(16)),
                Text(
                  'State',
                  style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp),
                ),
                SizedBox(height: getHeight(8)),
                CustomTextField2(
                  hintText: 'California',
                  controller: TextEditingController(text: 'California'),
                  readOnly: false,
                ),

                SizedBox(height: getHeight(16)),

                SizedBox(height: getHeight(69)),

                CustomButton(
                  textSize: 14,
                  borderColor: kPrimaryColor,
                  colors: [kWhiteColor, kWhiteColor],
                  textColor: kPrimaryColor,
                  title: 'Reject Business',
                  onTap: () => Get.back(),
                ),
                SizedBox(height: getHeight(16)),
                CustomButton(
                  textSize: 14,
                  title: 'Approve Business',
                  onTap: () => Get.back(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
