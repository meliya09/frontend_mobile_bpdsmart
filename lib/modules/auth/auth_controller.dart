import 'package:bpdsmart_diy/services/api.dart';
import 'package:bpdsmart_diy/models/models.dart';
import 'package:bpdsmart_diy/routes/routes.dart';
import 'package:bpdsmart_diy/shared/shared.dart';
import 'package:bpdsmart_diy/shared/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  AuthController({required this.apiRepository});
  final ApiRepository apiRepository;

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();
  final TextEditingController registerConfirmPasswordController =
      TextEditingController();
  bool registerTermsChecked = false;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> register(BuildContext context) async {
    AppFocus.unfocus(context);
    if (registerFormKey.currentState!.validate()) {
      if (!registerTermsChecked) {
        CommonWidget.toast('Please check the terms first.');
        return;
      }

      final RegisterResponse? res = await apiRepository.register(
        RegisterRequest(
          email: registerEmailController.text,
          password: registerPasswordController.text,
        ),
      );

      final SharedPreferences prefs = Get.find<SharedPreferences>();
      if (res!.accessToken.isNotEmpty) {
        prefs.setString(StorageConstants.token, res.accessToken);
        print('Go to Home screen>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
      }
    }
  }

  Future<void> login(BuildContext context) async {
    AppFocus.unfocus(context);
    if (loginFormKey.currentState!.validate()) {
      final LoginResponse? res = await apiRepository.login(
        LoginRequest(
          email: loginEmailController.text,
          password: loginPasswordController.text,
        ),
      );

      final SharedPreferences prefs = Get.find<SharedPreferences>();
      if (res != null) {
        if (res.accessToken.isNotEmpty) {
          prefs.setString(StorageConstants.token, res.accessToken);
          Get.toNamed(Routes.HOME);
          Get.snackbar('Berhasil', 'Selamat Berhasil Login');
        }
      }
      // else {
      //   Get.snackbar("title", 'coab');
      // }
    }
  }

  @override
  void onClose() {
    super.onClose();

    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();

    loginEmailController.dispose();
    loginPasswordController.dispose();
  }
}
