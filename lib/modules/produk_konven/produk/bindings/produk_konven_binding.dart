import 'package:get/get.dart';

import '../controllers/produk_konven_controller.dart';

class ProdukKonvenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProdukKonvenController>(
      () => ProdukKonvenController(),
    );
    // List<Bind> dependencies() {
    //   return [
    //     Bind.lazyPut<ProductController>(
    //       () => ProductController(),
    //     )
    // ];
  }
}
