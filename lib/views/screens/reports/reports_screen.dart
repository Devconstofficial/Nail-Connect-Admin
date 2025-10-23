import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nail_connect_admin/utils/app_colors.dart';
import 'package:nail_connect_admin/utils/app_constant_function.dart';
import 'package:nail_connect_admin/utils/app_images.dart';
import 'package:nail_connect_admin/utils/app_styles.dart';
import 'package:nail_connect_admin/views/screens/reports/controller/reports_controller.dart';

import '../../custom_widgets/base_layout.dart';

class ReportsScreen extends GetView<ReportsController> {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      headerTitle: "Reports",
      children: [
        Text(
          'Reports',
          style: AppStyles.otpTextStyle().copyWith(fontSize: 24.sp),
        ),
        SizedBox(height: getHeight(36)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: getWidth(30),
                  backgroundColor: kPinkColor.withOpacity(0.1),
                  child: Center(
                    child: Image.asset(kBriefcasePinkIcon, width: getWidth(24)),
                  ),
                ),
                SizedBox(width: getWidth(23)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$190,000',
                      style: AppStyles.otpTextStyle().copyWith(
                        color: kBlackColor.withOpacity(0.7),
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: getHeight(3)),
                    Text(
                      'Total Income',
                      style: AppStyles.hintTextStyle().copyWith(
                        color: kBlack1Color.withOpacity(0.7),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: getWidth(30),
                  backgroundColor: kPinkColor.withOpacity(0.1),
                  child: Center(
                    child: Image.asset(kBriefcasePinkIcon, width: getWidth(24)),
                  ),
                ),
                SizedBox(width: getWidth(23)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '190',
                      style: AppStyles.otpTextStyle().copyWith(
                        color: kBlackColor.withOpacity(0.7),
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: getHeight(3)),
                    Text(
                      'Total Jobs Posted',
                      style: AppStyles.hintTextStyle().copyWith(
                        color: kBlack1Color.withOpacity(0.7),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: getWidth(30),
                  backgroundColor: kPrimaryColor.withOpacity(0.1),
                  child: Center(
                    child: Image.asset(kApplicationIcon, width: getWidth(24)),
                  ),
                ),
                SizedBox(width: getWidth(23)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '178',
                      style: AppStyles.otpTextStyle().copyWith(
                        color: kBlackColor.withOpacity(0.7),
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: getHeight(3)),
                    Text(
                      'Total Applications',
                      style: AppStyles.hintTextStyle().copyWith(
                        color: kBlack1Color.withOpacity(0.7),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: getWidth(30),
                  backgroundColor: kBlueColor.withOpacity(0.2),
                  child: Center(
                    child: Image.asset(
                      kTotalProfessionalsIcon,
                      width: getWidth(24),
                      color: kBlueColor,
                    ),
                  ),
                ),
                SizedBox(width: getWidth(23)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '20',
                      style: AppStyles.otpTextStyle().copyWith(
                        color: kBlackColor.withOpacity(0.7),
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: getHeight(3)),
                    Text(
                      'Total Hires',
                      style: AppStyles.hintTextStyle().copyWith(
                        color: kBlack1Color.withOpacity(0.7),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: getHeight(35)),
      Text(
          'Incoming Request',
          style: AppStyles.buttonTextStyle().copyWith(
            fontWeight: FontWeight.w600,
            color: kBlack1Color,
          ),
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
                      _buildHeaderCell("Date"),
                      _buildHeaderCell("Job Posted"),
                      _buildHeaderCell("Applications"),
                      _buildHeaderCell("Hires"),
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
                        _buildItemCell(item['date'],),
                        _buildItemCell(item['jobsPosted'].toString(),),
                        _buildItemCell(item['applications'].toString(),),
                        _buildItemCell(item['hires'].toString()),
                    
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
        SizedBox(height: getHeight(35)),
      Text(
          'Commission Report',
          style: AppStyles.buttonTextStyle().copyWith(
            fontWeight: FontWeight.w600,
            color: kBlack1Color,
          ),
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
                      _buildHeaderCell("Month"),
                      _buildHeaderCell("Total Jobs"),
                      _buildHeaderCell("Commission %"),
                      _buildHeaderCell("Commission Value"),
                    ],
                  ),
                ),

                ...controller.paginatedRequests1.map((item) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getWidth(20),
                      vertical: getHeight(14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildItemCell(item['date'],),
                        _buildItemCell(item['totalJobs'].toString(),),
                        _buildItemCell(item['commission'],),
                        _buildItemCell(item['commissionValue']),
                    
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
                        onPressed: controller.currentPage1.value > 1
                            ? () => controller.goToPage1(
                                controller.currentPage1.value - 1,
                              )
                            : null,
                        child: const Text("Back"),
                      ),
                      SizedBox(width: getWidth(8)),
                      ...List.generate(controller.totalPages1, (index) {
                        final page = index + 1;
                        final isActive = controller.currentPage1.value == page;
                        return GestureDetector(
                          onTap: () => controller.goToPage1(page),
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
                            controller.currentPage1.value < controller.totalPages1
                            ? () => controller.goToPage1(
                                controller.currentPage1.value + 1,
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

  Widget _buildItemCell(String text) => Expanded(
    flex: 1,
    child: Row(
      children: [
       
        Text(text, style: AppStyles.tableItemTextStyle()),
      ],
    ),
  );

  
}
