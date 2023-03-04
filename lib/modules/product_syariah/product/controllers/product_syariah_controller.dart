import 'package:bpdsmart_diy/models/ProdukSyariah/syariah.dart';
import 'package:bpdsmart_diy/services/product_syariah_api/syariah_services.dart';
import 'package:get/get.dart';

class ProductSyariahController extends GetxController {
  List syariahList = <Syariah>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchSyariahs();
    super.onInit();
  }

  void fetchSyariahs() async {
    isLoading.value = true;
    final api = SyariahService().getSyariahs();
    final result = await api;
    syariahList = result;
    isLoading.value = false;
    update();
  }
}
