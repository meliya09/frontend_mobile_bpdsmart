import 'package:get/get.dart';

import '../controllers/layer_one_info_controller.dart';

class LayerOneInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayerOneInfoController>(
      () => LayerOneInfoController(),
    );
  }
}
