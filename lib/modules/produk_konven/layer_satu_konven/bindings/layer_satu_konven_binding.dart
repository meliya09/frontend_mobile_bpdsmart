import 'package:get/get.dart';

import '../controllers/layer_satu_konven_controller.dart';

class LayerSatuKonvenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayerSatuKonvenController>(
      () => LayerSatuKonvenController(),
    );
  }
}
