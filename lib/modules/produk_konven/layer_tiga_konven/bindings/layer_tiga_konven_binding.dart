import 'package:get/get.dart';

import '../controllers/layer_tiga_konven_controller.dart';

class LayerTigaKonvenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayerTigaKonvenController>(
      () => LayerTigaKonvenController(),
    );
  }
}
