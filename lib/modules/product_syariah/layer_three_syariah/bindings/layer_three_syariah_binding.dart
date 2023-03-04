import 'package:get/get.dart';

import '../controllers/layer_three_syariah_controller.dart';

class LayerThreeSyariahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayerThreeSyariahController>(
      () => LayerThreeSyariahController(),
    );
  }
}
