import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nail_connect_admin/utils/app_images.dart';

class JobsController extends GetxController{
  TextEditingController searchController = TextEditingController();
  final RxList<Map<String, dynamic>> users = <Map<String, dynamic>>[
    {
      "jobId": "NAIL–0001",
      "name": "Arora Gaur",
      "image": kUser,
      "email": "arroragaur@gmail.com",
      "duration": "One-Time",
      "postedDated": "12 Dec, 2022",
      "status": "Pending",
    },
    {
      "jobId": "NAIL–0002",
      "name": "Sarah Johnson",
      "email": "sha@gmail.com",
      "image": kUser1,
      "duration": "Monthly",
      "postedDated": "21 Oct, 2025",
      "status": "Active",
    },
    {
      "jobId": "NAIL–0003",
      "name": "Emily Brown",
      "email": "emily@mail.com",
      "image": kUser2,
      "duration": "One-Time",
      "postedDated": "12 Dec, 2022",
      "status": "Closed",
    },
    {
      "jobId": "NAIL–0004",
      "name": "John Smith",
      "email": "john.smith@mail.com",
      "image": kUser,
      "duration":"Weekly",
      "postedDated": "21 Oct, 2025",
      "status": "Active",
    },
    {
      "jobId": "NAIL–0005",
      "name": "Ava Wilson",
      "email": "avaw@gmail.com",
      "image": kUser1,
      "duration":"Weekly",
      "postedDated": "12 Dec, 2022",
      "status": "Pending",
    },
    {
      "jobId": "NAIL–0006",
      "name": "Noah Lee",
      "email": "noah@mail.com",
      "image": kUser2,
      "duration": "Monthly",
      "postedDated": "21 Oct, 2025",
      "status": "Active",
    },
    {
      "jobId": "NAIL–0007",
      "name": "Olivia Davis",
      "email": "olivia@mail.com",
      "image": kUser,
      "duration": "One-Time",
      "postedDated": "12 Dec, 2022",
      "status": "Closed",
    },
    {
      "jobId": "NAIL–0008",
      "name": "James Miller",
      "email": "james.m@mail.com",
      "image": kUser1,
      "duration":"Weekly",
      "postedDated": "21 Oct, 2025",
      "status": "Pending",
    },
    {
      "jobId": "NAIL–0009",
      "name": "Sophia Turner",
      "email": "sophiat@mail.com",
      "image": kUser2,
      "duration":"Monthly",
      "postedDated": "12 Dec, 2022",
      "status": "Active",
    },
    {
      "jobId": "NAIL–0010",
      "name": "William Scott",
      "email": "william@mail.com",
      "image": kUser,
      "duration": "One-Time",
      "postedDated": "21 Oct, 2025",
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

    filteredUsers.value = users.where((user) {
      final matchesSearch = query.isEmpty ||
          user["name"].toLowerCase().contains(query) ||
          user["email"].toLowerCase().contains(query) ||
          user["jobId"].toLowerCase().contains(query);
      return  matchesSearch;
    }).toList();

    currentPage.value = 1; 
  }

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() => applyFilters());
    applyFilters();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}