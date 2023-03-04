import 'package:get/get.dart';

import '../controllers/layer_one_syariah_controller.dart';

class LayerOneSyariahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayerOneSyariahController>(
      () => LayerOneSyariahController(),
    );
  }
}
