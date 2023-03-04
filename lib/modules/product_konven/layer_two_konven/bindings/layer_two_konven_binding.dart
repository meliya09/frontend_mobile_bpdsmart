import 'package:get/get.dart';

import '../controllers/layer_two_konven_controller.dart';

class LayerTwoKonvenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayerTwoKonvenController>(
      () => LayerTwoKonvenController(),
    );
  }
}
