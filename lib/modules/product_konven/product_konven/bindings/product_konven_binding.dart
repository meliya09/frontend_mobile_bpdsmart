import 'package:get/get.dart';

import '../controllers/product_konven_controller.dart';

class ProductKonvenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductKonvenController>(
      () => ProductKonvenController(),
    );
    // List<Bind> dependencies() {
    //   return [
    //     Bind.lazyPut<ProductController>(
    //       () => ProductController(),
    //     )
    // ];
  }
}
