import 'package:get/get.dart';

class ReportsController extends GetxController {
  final RxList<Map<String, dynamic>> jobReport = <Map<String, dynamic>>[
    {
      "jobsPosted": 12,
      "applications": 2,
      "date": "12 Dec, 2022",
      "hires": 2,
    },
    {
      "jobsPosted": 3,
      "applications": 9,
      "date": "21 Oct, 2025",
      "hires":4,
    },
    {
      "jobsPosted": 4,
      "applications": 1,
      "date": "12 Dec, 2022",
      "hires":9,
    },
    {
      "jobsPosted": 4,
      "applications": 2,
      "date": "21 Oct, 2025",
      "hires":4,
    },
    {
      "jobsPosted": 12,
      "applications": 122,
      "date": "12 Dec, 2022",
      "hires": 2,
    },
    {
      "jobsPosted": 1,
      "applications": 0,
      "date": "21 Oct, 2025",
      "hires":4,
    },
    {
      "jobsPosted": 2,
      "applications": 1,
      "date": "12 Dec, 2022",
      "hires":9,
    },
    {
      "jobsPosted": 4,
      "applications": 1,
      "date": "21 Oct, 2025",
      "hires": 2,
    },
    {
      "jobsPosted": 9,
      "applications": 2,
      "date": "12 Dec, 2022",
      "hires":4,
    },
    {
      "jobsPosted": 7,
      "applications": 3,
      "date": "21 Oct, 2025",
      "hires": 2,
    },
  ].obs;

  final RxInt currentPage = 1.obs;
  final int itemsPerPage = 5;

  List<Map<String, dynamic>> get paginatedRequests {
    final start = (currentPage.value - 1) * itemsPerPage;
    final end = start + itemsPerPage;
    return jobReport.sublist(
      start,
      end > jobReport.length ? jobReport.length : end,
    );
  }

  int get totalPages => (jobReport.length / itemsPerPage).ceil();

  void goToPage(int page) {
    if (page >= 1 && page <= totalPages) {
      currentPage.value = page;
    }
  }


  final RxList<Map<String, dynamic>> commissionReport = <Map<String, dynamic>>[
    {
      "totalJobs": 12,
      "commission": "21%",
      "date": "Dec, 2022",
      "commissionValue": "\$100",
    },
    {
      "totalJobs": 3,
      "commission": "7%",
      "date": "Oct, 2025",
      "commissionValue":"\$820",
    },
    {
      "totalJobs": 4,
      "commission": "7%",
      "date": "Dec, 2022",
      "commissionValue":"\$12,000",
    },
    {
      "totalJobs": 4,
      "commission": "23%",
      "date": "Oct, 2025",
      "commissionValue":"\$800",
    },
    {
      "totalJobs": 122,
      "commission": "12%",
      "date": "Dec, 2022",
      "commissionValue": "\$80",
    },
    {
      "totalJobs": 1,
      "commission": "10%",
      "date": "Oct, 2025",
      "commissionValue":"\$300",
    },
    {
      "totalJobs": 2,
      "commission": "5%",
      "date": "Dec, 2022",
      "commissionValue":"\$8300",
    },
    {
      "totalJobs": 4,
      "commission": "10%",
      "date": "Oct, 2025",
      "commissionValue": "\$80",
    },
    {
      "totalJobs": 9,
      "commission": "20%",
      "date": "Dec, 2022",
      "commissionValue":"\$8200",
    },
    {
      "totalJobs": 7,
      "commission": "15%",
      "date": "Oct, 2025",
      "commissionValue": "\$800",
    },
  ].obs;

  final RxInt currentPage1 = 1.obs;
  final int itemsPerPage1 = 5;

  List<Map<String, dynamic>> get paginatedRequests1 {
    final start = (currentPage1.value - 1) * itemsPerPage1;
    final end = start + itemsPerPage1;
    return commissionReport.sublist(
      start,
      end > commissionReport.length ? commissionReport.length : end,
    );
  }

  int get totalPages1 => (commissionReport.length / itemsPerPage1).ceil();

  void goToPage1(int page) {
    if (page >= 1 && page <= totalPages1) {
      currentPage1.value = page;
    }
  }
}
