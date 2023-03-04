import 'package:get/get.dart';

import '../controllers/layer_three_konven_controller.dart';

class LayerThreeKonvenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayerThreeKonvenController>(
      () => LayerThreeKonvenController(),
    );
  }
}
