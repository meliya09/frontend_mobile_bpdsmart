import 'package:get/get.dart';

import '../controllers/detail_konven_controller.dart';

class DetailKonvenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailKonvenController>(
      () => DetailKonvenController(),
    );
  }
}
