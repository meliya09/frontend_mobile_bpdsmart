import 'package:bpdsmart_diy/models/SearchMenu/search_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../product_syariah/product/controllers/product_syariah_controller.dart';
import '../networking/search_networking.dart';

class SearchController extends GetxController {
  // ignore: always_specify_types
  var searchList = List<SearchMenu>.empty(growable: true).obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getSearch();
  }

  // ignore: avoid_void_async
  void getSearch() async {
    final Search? search = await ApiService().getSearch(Get.arguments);

    try {
      if (search != null) {
        searchList.addAll(search.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
