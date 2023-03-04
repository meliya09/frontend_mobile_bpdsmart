import 'package:get/get.dart';

import '../controllers/product_syariah_controller.dart';

class ProductSyariahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductSyariahController>(
      () => ProductSyariahController(),
    );
    // List<Bind> dependencies() {
    //   return [
    //     Bind.lazyPut<ProductController>(
    //       () => ProductController(),
    //     )
    // ];
  }
}
