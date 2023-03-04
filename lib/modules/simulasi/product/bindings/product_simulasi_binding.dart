import 'package:get/get.dart';

import '../controllers/product_simulasi_controller.dart';

class ProductSimulasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductSimulasiController>(
      () => ProductSimulasiController(),
    );
    // List<Bind> dependencies() {
    //   return [
    //     Bind.lazyPut<ProductController>(
    //       () => ProductController(),
    //     )
    // ];
  }
}
