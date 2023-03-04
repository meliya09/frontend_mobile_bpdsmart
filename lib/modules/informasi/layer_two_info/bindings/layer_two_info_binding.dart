import 'package:get/get.dart';

import '../controllers/layer_two_info_controller.dart';

class LayerTwoInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayerTwoInfoController>(
      () => LayerTwoInfoController(),
    );
  }
}
