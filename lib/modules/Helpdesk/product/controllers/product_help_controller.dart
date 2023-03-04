import 'package:bpdsmart_diy/models/HelpdeskModel.dart';
import 'package:bpdsmart_diy/services/helpdesk_api/help_services.dart';
import 'package:get/get.dart';

class ProductHelpController extends GetxController {
  List helpList = <HelpdeskModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchHelp();
    super.onInit();
  }

  void fetchHelp() async {
    isLoading.value = true;
    final api = HelpService().getHelp();
    final result = await api;
    helpList = result;
    isLoading.value = false;
    update();
  }
}
