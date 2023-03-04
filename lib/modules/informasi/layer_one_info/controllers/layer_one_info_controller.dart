// ignore_for_file: unnecessary_overrides

import 'package:bpdsmart_diy/models/Informasi/jaringan_layanan.dart';
import 'package:bpdsmart_diy/models/Informasi/lokasi_atm.dart';
import 'package:bpdsmart_diy/services/informasi_api/jaringan_layanan_services.dart';
import 'package:bpdsmart_diy/services/informasi_api/lokasi_atm_services.dart';
import 'package:get/get.dart';

class LayerOneInfoController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  List jaringanLayanan = <JaringanLayanan>[].obs;

  final isJaringanLayananLoading = false.obs;

  List lokasiAtm = <LokasiATM>[].obs;

  final isLokasiATMLoading = false.obs;

  void fetchLayerOneInfo() async {
    final kontenId = Get.arguments;

    if (kontenId == "77") {
      isJaringanLayananLoading.value = true;

      final api = await JaringanLayananService().getJaringanLayanan();
      final result = api;
      jaringanLayanan = result;

      isJaringanLayananLoading.value = false;
    }

    if (kontenId == "85") {}

    // if (kontenId == "77") {
    //   isJaringanLayananLoading.value = true;

    //   final api = await JaringanLayananService().getJaringanLayanan();
    //   final result = api;
    //   jaringanLayanan = result;

    //   isJaringanLayananLoading.value = false;
    // }

    // if (kontenId == "85") {
    //   isLokasiATMLoading.value = true;

    //   final api = await LokasiATMService().getLokasiATM();
    //   final result = api;
    //   lokasiAtm = result;

    //   isLokasiATMLoading.value = false;
    // }
  }
}
