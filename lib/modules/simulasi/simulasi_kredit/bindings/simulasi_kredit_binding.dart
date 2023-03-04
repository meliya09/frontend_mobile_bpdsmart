import 'package:get/get.dart';

import '../controllers/simulasi_kredit_controller.dart';

class SimulasiKreditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SimulasiKreditController>(
      () => SimulasiKreditController(),
    );
  }
}
