import 'package:get/get.dart';

import '../controllers/layer_two_syariah_controller.dart';

class LayerTwoSyariahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayerTwoSyariahController>(
      () => LayerTwoSyariahController(),
    );
  }
}
