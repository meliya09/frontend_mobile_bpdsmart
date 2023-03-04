import 'package:get/get.dart';

import '../controllers/layer_two_internal_controller.dart';

class LayerTwoInternalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayerTwoInternalController>(
      () => LayerTwoInternalController(),
    );
  }
}
