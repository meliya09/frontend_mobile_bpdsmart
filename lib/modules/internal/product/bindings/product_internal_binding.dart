import 'package:get/get.dart';

import '../controllers/product_internal_controller.dart';

class ProductInternalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductInternalController>(
      () => ProductInternalController(),
    );
    // List<Bind> dependencies() {
    //   return [
    //     Bind.lazyPut<ProductController>(
    //       () => ProductController(),
    //     )
    // ];
  }
}
