import 'package:get/get.dart';

import '../controllers/product_help_controller.dart';

class ProductHelpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductHelpController>(
      () => ProductHelpController(),
    );
    // List<Bind> dependencies() {
    //   return [
    //     Bind.lazyPut<ProductController>(
    //       () => ProductController(),
    //     )
    // ];
  }
}
