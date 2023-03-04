import 'package:get/get.dart';

import '../controllers/detail_product2_controller.dart';

class DetailProduct2InternalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProduct2InternalController>(
      () => DetailProduct2InternalController(),
    );
  }
}
