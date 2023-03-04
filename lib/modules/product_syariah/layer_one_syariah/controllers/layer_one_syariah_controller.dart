// ignore_for_file: unnecessary_overrides

import 'package:bpdsmart_diy/models/ProdukSyariah/dana_syariah.dart';
import 'package:bpdsmart_diy/services/product_syariah_api/dana_syariah_services.dart';
import 'package:get/get.dart';

class LayerOneSyariahController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  List danaSyariah = <DanaSyariah>[].obs;

  final isDanaSyariahLoading = false.obs;

  void fetchLayerOneSyariah() async {
    final kontenId = Get.arguments;

    if (kontenId == "45") {
      isDanaSyariahLoading.value = true;

      final api = await DanaSyariahService().getSyariahs();
      final result = api;
      danaSyariah = result;

      isDanaSyariahLoading.value = false;
    }

    if (kontenId == "46") {
      // isDanaKonvenLoading.value = true;

      // final api = await DanaKonvenService().getKonvens();
      // final result = api;
      // danaKonven = result;

      // isDanaKonvenLoading.value = false;
    }

    if (kontenId == "47") {
      // isDanaKonvenLoading.value = true;

      // final api = await DanaKonvenService().getKonvens();
      // final result = api;
      // danaKonven = result;

      // isDanaKonvenLoading.value = false;
    }
  }
}
