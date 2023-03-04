import 'package:get/get.dart';

import '../controllers/detail_product_syariah_controller.dart';

class DetailProductSyariahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProductSyariahController>(
      () => DetailProductSyariahController(),
    );
  }
}
