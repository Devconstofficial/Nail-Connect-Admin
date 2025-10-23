import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nail_connect_admin/utils/app_colors.dart';
import 'package:nail_connect_admin/utils/app_constant_function.dart';
import 'package:nail_connect_admin/utils/app_images.dart';
import 'package:nail_connect_admin/utils/app_styles.dart';
import 'package:nail_connect_admin/views/custom_widgets/custom_confirm_dialog.dart';
import 'package:nail_connect_admin/views/custom_widgets/custom_textfield.dart';
import 'package:nail_connect_admin/views/custom_widgets/job_details_dialo.dart';
import 'package:nail_connect_admin/views/custom_widgets/update_status_dialog.dart';
import 'package:nail_connect_admin/views/screens/jobs/controller/jobs_controller.dart';

import '../../custom_widgets/base_layout.dart';

class JobsScreen extends GetView<JobsController> {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      headerTitle: "Jobs",
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Jobs Management',
              style: AppStyles.otpTextStyle().copyWith(fontSize: 24.sp),
            ),
            SizedBox(
              width: getWidth(230),
              height: getHeight(50),
              child: CustomTextField(
                hintText: 'Search',
                controller: controller.searchController,
                textInputType: TextInputType.emailAddress,
                suffix: Image.asset(
                  kSearchIcon,
                  width: getWidth(12),
                  color: kBlack1Color.withOpacity(0.4),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: getHeight(16)),
        Obx(() {
          return Container(
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
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: getWidth(20),
                    vertical: getHeight(14),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10.r),
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildHeaderCell("Job ID"),
                      _buildHeaderCell("Salon Name"),
                      _buildHeaderCell("Duration"),
                      _buildHeaderCell("Registration Date"),
                      _buildHeaderCell("Status"),
                      

                      _buildHeaderCell("Actions", isCenter: true),
                    ],
                  ),
                ),

                ...controller.paginatedRequests.map((item) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getWidth(20),
                      vertical: getHeight(14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildItemCell(item['jobId'], '', false),
                        _buildItemCell(item['name'], item['image'], true),
                        _buildItemCell(item['duration'], '', false),
_buildItemCell(item['postedDated'], '', false),
                        _buildStatusCell(item['status']),
                        
                        _buildActions(context),
                      ],
                    ),
                  );
                }),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: getHeight(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: controller.currentPage.value > 1
                            ? () => controller.goToPage(
                                controller.currentPage.value - 1,
                              )
                            : null,
                        child: const Text("Back"),
                      ),
                      SizedBox(width: getWidth(8)),
                      ...List.generate(controller.totalPages, (index) {
                        final page = index + 1;
                        final isActive = controller.currentPage.value == page;
                        return GestureDetector(
                          onTap: () => controller.goToPage(page),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: isActive
                                  ? kPrimaryColor
                                  : Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Text(
                              page.toString(),
                              style: TextStyle(
                                color: isActive ? Colors.white : kBlack1Color,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }),
                      SizedBox(width: getWidth(8)),
                      TextButton(
                        onPressed:
                            controller.currentPage.value < controller.totalPages
                            ? () => controller.goToPage(
                                controller.currentPage.value + 1,
                              )
                            : null,
                        child: const Text("Next"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildHeaderCell(String title, {bool isCenter = false}) => Expanded(
    flex: 1,
    child: Align(
      alignment: isCenter ? Alignment.center : Alignment.centerLeft,
      child: Text(title, style: AppStyles.tableHeaderTextStyle()),
    ),
  );

  Widget _buildItemCell(String text, String? image, bool isImage) => Expanded(
    flex: 1,
    child: Row(
      children: [
        if (image != '' && isImage)
          CircleAvatar(
            radius: getWidth(18),
            backgroundImage: AssetImage(image!),
          ),
        if (image != '' && isImage) SizedBox(width: getWidth(14)),
        Text(text, style: AppStyles.tableItemTextStyle()),
      ],
    ),
  );

  Widget _buildStatusCell(String status) {
    Color bgColor;
    Color textColor;
    switch (status) {
      case "Active":
        bgColor = kPrimaryColor.withOpacity(0.1);
        textColor = kPrimaryColor;
        break;
      case "Pending":
        bgColor = kBlue1Color.withOpacity(0.1);
        textColor = kBlue1Color;
        break;
      case "Closed":
        bgColor = kRedColor.withOpacity(0.1);
        textColor = kRedColor;
        break;
      default:
        bgColor = Colors.grey.withOpacity(0.1);
        textColor = Colors.grey;
    }
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getWidth(40),
          vertical: getHeight(8),
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Center(
          child: Text(
            status,
            style: AppStyles.tableItemTextStyle().copyWith(color: textColor),
          ),
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context) => Expanded(
    flex: 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            final RxString selectedUserStatus = ''.obs;
            final List<String> userStatusList = [
              'Active',
              'Pending',
              'Close',
            ];
            Get.dialog(
              UpdateStatusDialog(
                label: "Job Status",
                items: userStatusList,
                selectedValue: selectedUserStatus,
                onSave: () {
                  Get.back();
                },
              ),
            );
          },
          child: CircleAvatar(
            radius: getWidth(15),
            backgroundColor: kPrimaryColor,
            child: Image.asset(kEditIcon, width: getWidth(12)),
          ),
        ),
        SizedBox(width: getWidth(10)),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => CustomConfirmDialog(
                title: "Delete Job",
                subtitle: "Are you sure you want to delete this Job posting?",
                iconPath: Icons.delete_outline_outlined,
                onConfirm: () {
                  Get.back();
                },
              ),
            );
          },
          child: CircleAvatar(
            radius: getWidth(15),
            backgroundColor: kPrimaryColor,
            child: Image.asset(kDeleteIcon, width: getWidth(12)),
          ),
        ),
        SizedBox(width: getWidth(10)),
        GestureDetector(
          onTap: () {
            Get.dialog(JobDetailsDialog());
          },
          child: CircleAvatar(
            radius: getWidth(15),
            backgroundColor: kPrimaryColor,
            child: Image.asset(kViewIcon, width: getWidth(12)),
          ),
        ),
      ],
    ),
  );
}
