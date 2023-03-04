import 'package:get/get.dart';

import '../controller/search_controller.dart';

class SearchMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
  }
}
