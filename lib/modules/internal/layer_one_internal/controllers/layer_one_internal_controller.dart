// ignore_for_file: unnecessary_overrides

import 'package:bpdsmart_diy/models/Internal/std_layanan.dart';
import 'package:bpdsmart_diy/services/internal_api/std_layanan_services.dart';
import 'package:get/get.dart';

class LayerOneInternalController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  List stdLayanan = <StdLayanan>[].obs;

  final isStdLayananLoading = false.obs;

  void fetchLayerOne() async {
    final kontenId = Get.arguments;

    if (kontenId == "95") {
      isStdLayananLoading.value = true;

      final api = await StdLayananService().getStdLayanan();
      final result = api;
      stdLayanan = result;

      isStdLayananLoading.value = false;
    }

    if (kontenId == "96") {
      // isDanaKonvenLoading.value = true;

      // final api = await DanaKonvenService().getKonvens();
      // final result = api;
      // danaKonven = result;

      // isDanaKonvenLoading.value = false;
    }

    // if (kontenId == "9") {
    //   // isDanaKonvenLoading.value = true;

    //   // final api = await DanaKonvenService().getKonvens();
    //   // final result = api;
    //   // danaKonven = result;

    //   // isDanaKonvenLoading.value = false;
    // }
  }
}
