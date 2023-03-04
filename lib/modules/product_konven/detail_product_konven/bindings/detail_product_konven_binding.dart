import 'package:get/get.dart';

import '../controllers/detail_product_konven_controller.dart';

class DetailProductKonvenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProductKonvenController>(
      () => DetailProductKonvenController(),
    );
  }
}
