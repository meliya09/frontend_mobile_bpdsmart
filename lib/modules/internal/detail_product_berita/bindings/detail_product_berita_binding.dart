import 'package:get/get.dart';

import '../controllers/detail_product_berita_controller.dart';

class DetailProductBeritaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProductBeritaController>(
      () => DetailProductBeritaController(),
    );
  }
}
