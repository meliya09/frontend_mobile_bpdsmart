import 'package:bpdsmart_diy/modules/product_konven/detail_product_konven/controllers/detail_product_konven_controller.dart';
import 'package:bpdsmart_diy/modules/internal/detail_product_internal/controllers/detail_product_internal_controller.dart';
import 'package:bpdsmart_diy/modules/internal/detail_product_berita/controllers/detail_product_berita_controller.dart';
import 'package:get/get.dart';
import '../search_menu/controller/search_controller.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
        () => HomeController(apiRepository: Get.find()));
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
    Get.lazyPut<DetailProductInternalController>(
      () => DetailProductInternalController(),
    );
    Get.lazyPut<DetailProductBeritaController>(
      () => DetailProductBeritaController(),
    );
  }
}
