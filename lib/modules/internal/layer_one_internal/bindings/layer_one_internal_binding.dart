import 'package:get/get.dart';

import '../controllers/layer_one_internal_controller.dart';

class LayerOneInternalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayerOneInternalController>(
      () => LayerOneInternalController(),
    );
  }
}
