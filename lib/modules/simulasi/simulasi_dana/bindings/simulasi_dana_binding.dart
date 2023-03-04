import 'package:get/get.dart';

import '../controllers/simulasi_dana_controller.dart';

class SimulasiDanaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SimulasiDanaController>(
      () => SimulasiDanaController(),
    );
  }
}
