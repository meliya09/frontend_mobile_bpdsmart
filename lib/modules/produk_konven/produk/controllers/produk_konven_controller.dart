import 'package:bpdsmart_diy/models/Konvensional/konven_model.dart';
import 'package:bpdsmart_diy/services/konvensional_api/konven_services.dart';
import 'package:get/get.dart';

class ProdukKonvenController extends GetxController {
  List konvenList = <KonvenModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchKonven();
    super.onInit();
  }

  void fetchKonven() async {
    isLoading.value = true;
    final api = KonvenService().getKonvens();
    final result = await api;
    konvenList = result;
    isLoading.value = false;
    update();
  }
}
