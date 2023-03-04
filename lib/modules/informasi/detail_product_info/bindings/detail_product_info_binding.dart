import 'package:get/get.dart';

import '../controllers/detail_product_info_controller.dart';

class DetailProductInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProductInfoController>(
      () => DetailProductInfoController(),
    );
  }
}
