import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nail_connect_admin/views/custom_widgets/custom_button.dart';
import 'package:nail_connect_admin/views/custom_widgets/dropdown2.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constant_function.dart';
import '../../utils/app_styles.dart';

class UpdateStatusDialog extends StatelessWidget {
  final String label;
  final List<String> items;
  final RxString selectedValue;
  final VoidCallback? onSave;

  const UpdateStatusDialog({
    super.key,
    required this.label,
    required this.items,
    required this.selectedValue,
    this.onSave,
  });

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
        height: 300.h,
        child: Padding(
          padding: EdgeInsets.all(getWidth(24)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---- Header ----
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Update Status",
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

              SizedBox(height: getHeight(20)),

              // ---- Label ----
              Text(
                label,
                style: AppStyles.labelTextStyle().copyWith(fontSize: 12.sp),
              ),

              SizedBox(height: getHeight(8)),

              // ---- Dropdown ----
              Obx(
                () => CustomDropdownWidget2(
                  items: items,
                  hintText: "Select $label",
                  value: selectedValue.value.isEmpty
                      ? null
                      : selectedValue.value,
                  onChanged: (value) {
                    if (value != null) selectedValue.value = value;
                  },
                ),
              ),

              SizedBox(height: getHeight(32)),

              // ---- Buttons ----
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    title: 'Close',
                    onTap: () => Get.back(),
                    width: 93,
                    height: 40,
                    colors: [kWhiteColor, kWhiteColor],
                    textColor: kPrimaryColor,
                    borderColor: kPrimaryColor,
                    borderRadius: 10,
                    textSize: 14,
                  ),
                  SizedBox(width: getWidth(16)),
                  CustomButton(
                    title: 'Save',
                    onTap: () {
                      if (onSave != null) onSave!();
                      Get.back();
                    },
                    width: 93,
                    height: 40,
                    borderRadius: 10,
                    textSize: 14,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
