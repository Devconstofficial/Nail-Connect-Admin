import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nail_connect_admin/utils/app_images.dart';
import 'package:nail_connect_admin/views/custom_widgets/custom_button.dart';
import 'package:nail_connect_admin/views/custom_widgets/custom_textfield_2.dart';
import 'package:nail_connect_admin/views/custom_widgets/dropdown2.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constant_function.dart';
import '../../utils/app_styles.dart';

class JobDetailsDialog extends StatelessWidget {
  JobDetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
  TextEditingController shiftTitleController = TextEditingController();
  TextEditingController noPositionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController commissionController = TextEditingController();
  RxString professionRequired = ''.obs;
  RxString shiftType = ''.obs;
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
                      "Job Details",
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

                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: getHeight(16)),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kScaffoldColor),
                    boxShadow: [
                      BoxShadow(
                        color: kBlackColor.withOpacity(0.1),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(kBriefCaseIcon, width: getWidth(25)),
                          SizedBox(width: getWidth(8)),
                          Text(
                            'Shift Details',
                            style: AppStyles.labelTextStyle(),
                          ),
                        ],
                      ),
                      SizedBox(height: getHeight(22)),
                      Text(
                        "Shift Title",
                        style: AppStyles.inputTextStyle().copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: getHeight(4)),
                      CustomTextField2(
                        hintText: "Enter Shift Title",
                        controller: shiftTitleController,
                      ),
                      SizedBox(height: getHeight(20)),
                      Text(
                        "Profession Required",
                        style: AppStyles.inputTextStyle().copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: getHeight(4)),
                      Obx(
                        () => CustomDropdownWidget2(
                          hintText: "Select Your Required Profession",
                          items: const [
                            'Nail Technician',
                            'Hair Stylist',
                            'Makeup Artist',
                            'Nail Salon',
                            'Esthetician',
                            'Barber',
                            'Message Therapist',
                            'Beauty Advisor',
                            'Receptionist',
                          ],
                          value: professionRequired.value.isEmpty
                              ? null
                              : professionRequired.value,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              professionRequired.value = newValue;
                            }
                          },
                        ),
                      ),
                      SizedBox(height: getHeight(20)),
                      Text(
                        "Shift Type",
                        style: AppStyles.inputTextStyle().copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: getHeight(4)),
                      Obx(
                        () => CustomDropdownWidget2(
                          hintText: "Select Shift Type",
                          items: const [
                            'Daily',
                            'Weekly',
                            'Monthly',
                            'Temp-To-Hire',
                          ],
                          value: shiftType.value.isEmpty
                              ? null
                              : shiftType.value,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              shiftType.value = newValue;
                            }
                          },
                        ),
                      ),
                      SizedBox(height: getHeight(20)),
                      Text(
                        "No. of Positions",
                        style: AppStyles.inputTextStyle().copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: getHeight(4)),
                      CustomTextField2(
                        hintText: "Enter No.of Positions",
                        controller: noPositionController,
                        textInputType: TextInputType.number,
                      ),
                      SizedBox(height: getHeight(20)),
                      Text(
                        "Shift Description",
                        style: AppStyles.inputTextStyle().copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: getHeight(4)),
                      CustomTextField2(
                        hintText:
                            "Describe the role and what you’re looking for...",
                        controller: descriptionController,
                        maxLines: 3,
                        textInputType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getHeight(16)),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: getHeight(16)),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kScaffoldColor),
                    boxShadow: [
                      BoxShadow(
                        color: kBlackColor.withOpacity(0.1),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.watch_later_outlined, color: kBlack1Color),
                          SizedBox(width: getWidth(8)),
                          Text(
                            'Schedule & Duration',
                            style: AppStyles.labelTextStyle(),
                          ),
                        ],
                      ),
                      SizedBox(height: getHeight(22)),
                      Text(
                        "Date",
                        style: AppStyles.inputTextStyle().copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: getHeight(4)),
                      CustomTextField2(
                        hintText: "MM/DD/YYYY",
                        controller: dateController,
                        textInputType: TextInputType.datetime,
                      ),
                      SizedBox(height: getHeight(20)),

                      Text(
                        "Start Time",
                        style: AppStyles.inputTextStyle().copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: getHeight(4)),
                      CustomTextField2(
                        hintText: "--:--:--",
                        controller: startTimeController,
                      ),
                      SizedBox(height: getHeight(20)),
                      Text(
                        "End Time",
                        style: AppStyles.inputTextStyle().copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: getHeight(4)),
                      CustomTextField2(
                        hintText: "--:--:--",
                        controller: endTimeController,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getHeight(16)),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: getHeight(16)),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kScaffoldColor),
                    boxShadow: [
                      BoxShadow(
                        color: kBlackColor.withOpacity(0.1),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(kDollarSignIcon, width: getWidth(15)),
                          SizedBox(width: getWidth(8)),
                          Text('Commission', style: AppStyles.labelTextStyle()),
                        ],
                      ),
                      SizedBox(height: getHeight(22)),
                      Text(
                        "Amount (\$/h)",
                        style: AppStyles.inputTextStyle().copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: getHeight(4)),
                      CustomTextField2(
                        hintText: "Enter Your Rate",
                        controller: commissionController,
                        textInputType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
               

                SizedBox(height: getHeight(29)),

                CustomButton(
                  textSize: 14,
                  borderColor: kPrimaryColor,
                  colors: [kWhiteColor, kWhiteColor],
                  textColor: kPrimaryColor,
                  title: 'Reject Job',
                  onTap: () => Get.back(),
                ),
                SizedBox(height: getHeight(16)),
                CustomButton(
                  textSize: 14,
                  title: 'Approve Job',
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
