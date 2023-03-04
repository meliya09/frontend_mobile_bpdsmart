import 'package:get/get.dart';

import '../controllers/layer_one_konven_controller.dart';

class LayerOneKonvenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayerOneKonvenController>(
      () => LayerOneKonvenController(),
    );
  }
}
