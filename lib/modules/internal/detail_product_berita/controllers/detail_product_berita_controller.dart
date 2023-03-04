// ignore_for_file: unnecessary_overrides

import 'package:bpdsmart_diy/models/Internal/berita_terkini.dart';
import 'package:bpdsmart_diy/services/internal_api/berita_terkini_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProductBeritaController extends GetxController {
  List beritaList = <BeritaTerkini>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchBeritaTerkini();
    super.onInit();
  }

  void fetchBeritaTerkini() async {
    isLoading.value = true;
    final api = BeritaTerkiniService().getBeritaTerkini();
    final result = await api;
    beritaList = result;
    isLoading.value = false;
    update();
  }
}


// class DetailProductBeritaController extends GetxController
//     with GetSingleTickerProviderStateMixin {
//   @override
//   void onInit() {
//     tabController = TabController(length: 2, vsync: this);
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     tabController?.dispose();
//     super.onClose();
//   }

//   TabController? tabController;
// }
