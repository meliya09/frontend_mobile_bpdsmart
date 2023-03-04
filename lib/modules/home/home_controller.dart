import 'dart:math';
import 'package:bpdsmart_diy/models/InfoBerita/InfoBerita.dart';
import 'package:bpdsmart_diy/modules/informasi/product/views/product_info_view.dart';
import 'package:bpdsmart_diy/services/api.dart';
import 'package:bpdsmart_diy/models/response/users_response.dart';
import 'package:bpdsmart_diy/modules/home/home.dart';
import 'package:bpdsmart_diy/services/infoberita/infoberita_api.dart';
import 'package:bpdsmart_diy/shared/shared.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../../models/SearchMenu/search_model.dart';
import '../../services/popular_provider.dart';
import '../search_menu/networking/search_networking.dart';

import 'package:bpdsmart_diy/models/InfoBerita/InfoBerita.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bpdsmart_diy/services/infoberita/infoberita_api.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;

  HomeController({required this.apiRepository});

  RxBool isLoading = false.obs;
  Rx<MainTabs> currentTab = MainTabs.home.obs;
  Rxn<UsersResponse> users = Rxn<UsersResponse>();
  // ignore: always_specify_types
  Rxn user = Rxn<Datum>();

  RxList lstPopular = List<dynamic>.empty(growable: true).obs;
  RxBool isDataProcessing = false.obs;
  RxBool isDataError = false.obs;
  var data = Get.arguments;
  late MainTab mainTab;
  late ProductInfoView infoTab;
  late SearchViews searchTab;
  late HelpdeskTab helpdeskTab;

  static HomeController instance = Get.find();
  RxList<InfoBerita> beritaItemList =
      List<InfoBerita>.empty(growable: true).obs;
  RxBool isBeritaLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    mainTab = MainTab();
    getBerita();

    infoTab = ProductInfoView();
    searchTab = SearchViews(
      category: '',
    );
    helpdeskTab = HelpdeskTab();
    getPopular();
  }

  void getBerita() async {
    try {
      isLoading(true);
      var result = await InfoBeritaService().getInfoBerita();
      beritaItemList.assignAll(result);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }

  //search
  var searchList = List<SearchMenu>.empty(growable: true).obs;
  List infoBeritaList = <InfoBerita>[].obs;

  void getSearch() async {
    final Search? search = await ApiService().getSearch(Get.arguments);

    try {
      if (search != null) {
        searchList.addAll(search.data);
      }
    } finally {
      isLoading(false);
    }
  }

  void getPopular() {
    try {
      isDataProcessing(true);
      PopularProvider().getPopular().then((List resp) {
        lstPopular.clear();
        isDataProcessing(false);
        lstPopular.addAll(resp);
        isDataError(false);
      }, onError: (err) {
        isDataProcessing(false);
        isDataError(true);
      });
    } catch (exception) {
      isDataProcessing(false);
      isDataError(true);
    }
  }

  void signout() {
    SharedPreferences prefs = Get.find<SharedPreferences>();
    prefs.clear();

    // Get.back();
    NavigatorHelper.popLastScreens(popCount: 2);
  }

  void _saveUserInfo(UsersResponse users) {
    Random random = new Random();
    int index = random.nextInt(users.data!.length);
    user.value = users.data![index];
    SharedPreferences prefs = Get.find<SharedPreferences>();
    prefs.setString(StorageConstants.userInfo, users.data![index].toRawJson());
  }

  void switchTab(index) {
    MainTabs tab = _getCurrentTab(index);
    currentTab.value = tab;
  }

  int getCurrentIndex(MainTabs tab) {
    switch (tab) {
      case MainTabs.info:
        return 0;
      case MainTabs.home:
        return 1;
      case MainTabs.helpdesk:
        return 2;
      default:
        return 0;
    }
  }

  MainTabs _getCurrentTab(int index) {
    switch (index) {
      case 0:
        return MainTabs.info;
      case 1:
        return MainTabs.home;
      case 2:
        return MainTabs.helpdesk;
      default:
        return MainTabs.home;
    }
  }

  @override
  void onReady() {
    super.onReady();
    getPopular();
  }

  @override
  void onClose() {
    super.onClose();
    getPopular();
  }
}
