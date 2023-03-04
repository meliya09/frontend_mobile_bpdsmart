import 'package:bpdsmart_diy/models/Internal/internal.dart';
import 'package:bpdsmart_diy/services/internal_api/internal_services.dart';
import 'package:get/get.dart';

class ProductInternalController extends GetxController {
  List internalList = <Internal>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchInternals();
    super.onInit();
  }

  void fetchInternals() async {
    isLoading.value = true;
    final api = InternalService().getInternals();
    final result = await api;
    internalList = result;
    isLoading.value = false;
    update();
  }
}
