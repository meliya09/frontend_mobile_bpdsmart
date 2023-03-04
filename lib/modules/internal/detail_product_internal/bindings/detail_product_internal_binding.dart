import 'package:get/get.dart';

import '../controllers/detail_product_internal_controller.dart';

class DetailProductInternalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProductInternalController>(
      () => DetailProductInternalController(),
    );
  }
}
