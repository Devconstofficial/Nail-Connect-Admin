import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nail_connect_admin/utils/app_images.dart';
import 'package:nail_connect_admin/views/custom_widgets/custom_button.dart';
import 'package:nail_connect_admin/views/custom_widgets/custom_textfield_2.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constant_function.dart';
import '../../utils/app_styles.dart';

class ViewUserInfo extends StatelessWidget {
  final RxInt selectedView = 0.obs;

  ViewUserInfo({super.key});

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
                // Header row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Arrora Gaur",
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
                    backgroundImage: AssetImage(kUser),
                  ),
                ),

                SizedBox(height: getHeight(32)),
                Container(
                  width: getWidth(345),
                  height: getHeight(46),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: kContainerGreyColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _tabButton("Personal Details", 0),
                        _tabButton("Bank Details", 1),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: getHeight(32)),
                Obx(() {
                  if (selectedView.value == 0) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Full Name', style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp)),
                        SizedBox(height: getHeight(8)),
                        CustomTextField2(
                          hintText: 'John Doe',
                          controller: TextEditingController(text: 'John Doe'),
                          readOnly: false,
                        ),
                        SizedBox(height: getHeight(16)),

                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email', style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp)),
                                  SizedBox(height: getHeight(8)),
                                  CustomTextField2(
                                    hintText: 'example@gmail.com',
                                    controller: TextEditingController(text: 'example@gmail.com'),
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
                                  Text('Phone Number', style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp)),
                                  SizedBox(height: getHeight(8)),
                                  CustomTextField2(
                                    hintText: '3375005467',
                                    controller: TextEditingController(text: '1234567890'),
                                    readOnly: false,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: getHeight(16)),

                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Date of Birth', style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp)),
                                  SizedBox(height: getHeight(8)),
                                  CustomTextField2(
                                    hintText: '17/05/1991',
                                    controller: TextEditingController(text: '17/05/1991'),
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
                                  Text('Gender', style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp)),
                                  SizedBox(height: getHeight(8)),
                                  CustomTextField2(
                                    hintText: 'Male',
                                    controller: TextEditingController(text: 'Male'),
                                    readOnly: false,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: getHeight(16)),

                        Text('Experience', style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp)),
                        SizedBox(height: getHeight(8)),
                        CustomTextField2(
                          hintText: '1–2 years',
                          controller: TextEditingController(text: '1-2 years'),
                          readOnly: false,
                        ),
                        SizedBox(height: getHeight(16)),

                        Text('Profession', style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp)),
                        SizedBox(height: getHeight(8)),
                        Container(
                          width: getWidth(84),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Center(
                            child: Text(
                              'Gel Nails',
                              style: AppStyles.inputTextStyle().copyWith(color: kPrimaryColor, fontSize: 12.sp),
                            ),
                          ),
                        ),
                        SizedBox(height: getHeight(16)),

                        Text('Hourly Rate', style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp)),
                        SizedBox(height: getHeight(8)),
                        Container(
                          width: getWidth(84),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: Center(
                            child: Text(
                              '\$25.00',
                              style: AppStyles.inputTextStyle().copyWith(color: kPrimaryColor, fontSize: 12.sp),
                            ),
                          ),
                        ),
                        
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bank Name', style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp)),
                        SizedBox(height: getHeight(8)),
                        CustomTextField2(
                          hintText: 'Bank of America',
                          readOnly: false,
                          controller: TextEditingController(text: 'Bank Of America'),
                        ),
                        SizedBox(height: getHeight(16)),

                        Text('Account Holder Name', style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp)),
                        SizedBox(height: getHeight(8)),
                        CustomTextField2(
                          hintText: 'John Doe',
                          controller: TextEditingController(text: 'John Doe'),
                          readOnly: false,
                        ),
                        SizedBox(height: getHeight(16)),

                        Text('Account Number', style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp)),
                        SizedBox(height: getHeight(8)),
                        CustomTextField2(
                          controller: TextEditingController(text: '1234567890'),
                          hintText: '1234567890',
                          readOnly: false,
                        ),
                        SizedBox(height: getHeight(16)),

                        Text('Routing Number', style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp)),
                        SizedBox(height: getHeight(8)),
                        CustomTextField2(
                          controller: TextEditingController(text: '021000021'),
                          hintText: '021000021',
                          readOnly: false,
                        ),
                      ],
                    );
                  }
                }),

                SizedBox(height: getHeight(69)),

                CustomButton(
                  textSize: 14,
                  borderColor: kPrimaryColor,
                  colors: [kWhiteColor, kWhiteColor],
                  textColor: kPrimaryColor,
                  title: 'Reject Professional',
                  onTap: () => Get.back(),
                ),
                SizedBox(height: getHeight(16)),
                CustomButton(
                  textSize: 14,
                  title: 'Approve Professional',
                  onTap: () => Get.back(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tabButton(String label, int index) {
    return GestureDetector(
      onTap: () => selectedView.value = index,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(29),
          vertical: getHeight(3),
        ),
        decoration: BoxDecoration(
          color:
              selectedView.value == index ? kWhiteColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: selectedView.value == index
                ? AppStyles.tableViewActiveTextStyle()
                : AppStyles.tableViewInctiveTextStyle(),
          ),
        ),
      ),
    );
  }
}
