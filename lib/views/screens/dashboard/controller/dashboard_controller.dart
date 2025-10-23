import 'package:get/get.dart';
import 'package:nail_connect_admin/utils/app_images.dart';

class DashboardController extends GetxController {

  final RxList<Map<String, dynamic>> incomingRequests = <Map<String, dynamic>>[
    {
      "userId": "NAIL–0001",
      "name": "Arora gaur",
      "image": kUser,
      "email": "arroragaur@gmail.com",
      "registerationDate": "12 Dec, 2022",
      "status": "Pending",
    },
    {
      "userId": "NAIL–0002",
      "name": "Sarah Johnson",
      "email": "sha@gmail.com",
      "image": kUser1,
      "registerationDate": "21 Oct, 2025",
      "status": "Active",
    },
    {
      "userId": "NAIL–0003",
      "name": "Emily Brown",
      "email": "emily@mail.com",
      "image": kUser2,
      "registerationDate": "12 Dec, 2022",
      "status": "Suspended",
    },
    {
      "userId": "NAIL–0004",
      "name": "John Smith",
      "email": "john.smith@mail.com",
      "image": kUser,
      "registerationDate": "21 Oct, 2025",
      "status": "Active",
    },
    {
      "userId": "NAIL–0005",
      "name": "Ava Wilson",
      "email": "avaw@gmail.com",
      "image": kUser1,
      "registerationDate": "12 Dec, 2022",
      "status": "Pending",
    },
    {
      "userId": "NAIL–0006",
      "name": "Noah Lee",
      "email": "noah@mail.com",
      "image": kUser2,
      "registerationDate": "21 Oct, 2025",
      "status": "Active",
    },
    {
      "userId": "NAIL–0007",
      "name": "Olivia Davis",
      "email": "olivia@mail.com",
      "image": kUser,
      "registerationDate": "12 Dec, 2022",
      "status": "Suspended",
    },
    {
      "userId": "NAIL–0008",
      "name": "James Miller",
      "email": "james.m@mail.com",
      "image": kUser1,
      "registerationDate": "21 Oct, 2025",
      "status": "Pending",
    },
    {
      "userId": "NAIL–0009",
      "name": "Sophia Turner",
      "email": "sophiat@mail.com",
      "image": kUser2,
      "registerationDate": "12 Dec, 2022",
      "status": "Active",
    },
    {
      "userId": "NAIL–0010",
      "name": "William Scott",
      "email": "william@mail.com",
      "image": kUser,
      "registerationDate": "21 Oct, 2025",
      "status": "Pending",
    },
  ].obs;

  final RxInt currentPage = 1.obs;
  final int itemsPerPage = 5;

  List<Map<String, dynamic>> get paginatedRequests {
    final start = (currentPage.value - 1) * itemsPerPage;
    final end = start + itemsPerPage;
    return incomingRequests.sublist(
      start,
      end > incomingRequests.length ? incomingRequests.length : end,
    );
  }

  int get totalPages => (incomingRequests.length / itemsPerPage).ceil();

  void goToPage(int page) {
    if (page >= 1 && page <= totalPages) {
      currentPage.value = page;
    }
  }
}
