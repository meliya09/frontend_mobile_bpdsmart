import 'package:bpdsmart_diy/models/ProdukKonven/konven.dart';
import 'package:bpdsmart_diy/services/product_konvensional_api/konven_services.dart';
import 'package:get/get.dart';

class ProductKonvenController extends GetxController {
  // ignore: always_specify_types
  List konvenList = <Konven>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchKonven();
    super.onInit();
  }

  void fetchKonven() async {
    isLoading.value = true;
    final Future<List<Konven>> api = KonvenService().getKonvens();
    final List<Konven> result = await api;
    konvenList = result;
    isLoading.value = false;
    update();
  }
}
