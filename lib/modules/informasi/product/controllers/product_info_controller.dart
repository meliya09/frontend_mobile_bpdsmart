import 'package:bpdsmart_diy/models/Informasi/info.dart';
import 'package:bpdsmart_diy/services/informasi_api/info_services.dart';
import 'package:get/get.dart';

class ProductInfoController extends GetxController {
  List infoList = <Info>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchInfo();
    super.onInit();
  }

  void fetchInfo() async {
    isLoading.value = true;
    final api = InfoService().getInfo();
    final result = await api;
    infoList = result;
    isLoading.value = false;
    update();
  }
}
