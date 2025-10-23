import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../utils/app_images.dart';

class UsersController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxInt index = 0.obs; 
  final RxList<Map<String, dynamic>> users = <Map<String, dynamic>>[
    {
      "userId": "NAIL–0001",
      "name": "Arora Gaur",
      "image": kUser,
      "email": "arroragaur@gmail.com",
      "userType": "Technicians",
      "registerationDate": "12 Dec, 2022",
      "status": "Pending",
    },
    {
      "userId": "NAIL–0002",
      "name": "Sarah Johnson",
      "email": "sha@gmail.com",
      "image": kUser1,
      "userType": "Technicians",
      "registerationDate": "21 Oct, 2025",
      "status": "Active",
    },
    {
      "userId": "NAIL–0003",
      "name": "Emily Brown",
      "email": "emily@mail.com",
      "image": kUser2,
      "userType": "Technicians",
      "registerationDate": "12 Dec, 2022",
      "status": "Suspended",
    },
    {
      "userId": "NAIL–0004",
      "name": "John Smith",
      "email": "john.smith@mail.com",
      "image": kUser,
      "userType": "Salons",
      "registerationDate": "21 Oct, 2025",
      "status": "Active",
    },
    {
      "userId": "NAIL–0005",
      "name": "Ava Wilson",
      "email": "avaw@gmail.com",
      "image": kUser1,
      "userType": "Salons",
      "registerationDate": "12 Dec, 2022",
      "status": "Pending",
    },
    {
      "userId": "NAIL–0006",
      "name": "Noah Lee",
      "email": "noah@mail.com",
      "image": kUser2,
      "userType": "Technicians",
      "registerationDate": "21 Oct, 2025",
      "status": "Active",
    },
    {
      "userId": "NAIL–0007",
      "name": "Olivia Davis",
      "email": "olivia@mail.com",
      "image": kUser,
      "userType": "Technicians",
      "registerationDate": "12 Dec, 2022",
      "status": "Suspended",
    },
    {
      "userId": "NAIL–0008",
      "name": "James Miller",
      "email": "james.m@mail.com",
      "image": kUser1,
      "userType": "Salons",
      "registerationDate": "21 Oct, 2025",
      "status": "Pending",
    },
    {
      "userId": "NAIL–0009",
      "name": "Sophia Turner",
      "email": "sophiat@mail.com",
      "image": kUser2,
      "userType": "Salons",
      "registerationDate": "12 Dec, 2022",
      "status": "Active",
    },
    {
      "userId": "NAIL–0010",
      "name": "William Scott",
      "email": "william@mail.com",
      "image": kUser,
      "userType": "Technicians",
      "registerationDate": "21 Oct, 2025",
      "status": "Pending",
    },
  ].obs;

  RxList<Map<String, dynamic>> filteredUsers = <Map<String, dynamic>>[].obs;

  final RxInt currentPage = 1.obs;
  final int itemsPerPage = 5;

  List<Map<String, dynamic>> get paginatedRequests {
    final start = (currentPage.value - 1) * itemsPerPage;
    final end = start + itemsPerPage;
    return filteredUsers.sublist(
      start,
      end > filteredUsers.length ? filteredUsers.length : end,
    );
  }

  int get totalPages => (filteredUsers.length / itemsPerPage).ceil();

  void goToPage(int page) {
    if (page >= 1 && page <= totalPages) {
      currentPage.value = page;
    }
  }
  void applyFilters() {
    final query = searchController.text.toLowerCase();
    final selectedType = index.value == 0 ? "Technicians" : "Salons";

    filteredUsers.value = users.where((user) {
      final matchesType = user["userType"] == selectedType;
      final matchesSearch = query.isEmpty ||
          user["name"].toLowerCase().contains(query) ||
          user["email"].toLowerCase().contains(query) ||
          user["userId"].toLowerCase().contains(query);
      return matchesType && matchesSearch;
    }).toList();

    currentPage.value = 1; 
  }

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() => applyFilters());
    ever(index, (_) => applyFilters());
    applyFilters();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
