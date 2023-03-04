// ignore_for_file: unnecessary_overrides

import 'package:bpdsmart_diy/models/Konvensional/danakonven_model.dart';
import 'package:bpdsmart_diy/services/konvensional_api/dana_konven_services.dart';
import 'package:get/get.dart';

class LayerSatuKonvenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  List danaKonven = <DanakonvenModel>[].obs;

  final isDanaKonvenLoading = false.obs;

  void fetchLayerSatuKonven() async {
    final kontenId = Get.arguments;

    if (kontenId == "7") {
      isDanaKonvenLoading.value = true;

      final api = await DanaKonvenService().getDanaKonvens();
      final result = api;
      danaKonven = result;

      isDanaKonvenLoading.value = false;
    }

    if (kontenId == "8") {
      // isDanaKonvenLoading.value = true;

      // final api = await DanaKonvenService().getKonvens();
      // final result = api;
      // danaKonven = result;

      // isDanaKonvenLoading.value = false;
    }

    if (kontenId == "9") {
      // isDanaKonvenLoading.value = true;

      // final api = await DanaKonvenService().getKonvens();
      // final result = api;
      // danaKonven = result;

      // isDanaKonvenLoading.value = false;
    }
  }
}
