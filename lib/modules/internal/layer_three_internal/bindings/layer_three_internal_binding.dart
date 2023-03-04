import 'package:get/get.dart';

import '../controllers/layer_three_internal_controller.dart';

class LayerThreeInternalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayerThreeInternalController>(
      () => LayerThreeInternalController(),
    );
  }
}
