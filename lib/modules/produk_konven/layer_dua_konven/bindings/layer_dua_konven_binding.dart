import 'package:get/get.dart';

import '../controllers/layer_dua_konven_controller.dart';

class LayerDuaKonvenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayerDuaKonvenController>(
      () => LayerDuaKonvenController(),
    );
  }
}
