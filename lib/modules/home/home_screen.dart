import 'package:bpdsmart_diy/modules/home/home.dart';
import 'package:bpdsmart_diy/modules/home/tabs/search_tab.dart';
import 'package:bpdsmart_diy/shared/shared.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => _buildWidget()),
    );
  }

  Widget _buildWidget() {
    return Scaffold(
      body: Center(
        child: _buildContent(controller.currentTab.value),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          // _buildNavigationBarItem(
          //   "Home",
          //   MainTabs.home == controller.currentTab.value
          //       ? "icon_home_activited.svg"
          //       : "icon_home.svg",
          // ),
          _buildNavigationBarItem(
            "Informasi",
            MainTabs.info == controller.currentTab.value
                ? "icon_discover_activited.svg"
                : "icon_discover.svg",
          ),
          // _buildNavigationBarItem(
          //   "Search",
          //   "icon_resource.svg",
          // ),
          _buildNavigationBarItem(
            "Home",
            MainTabs.home == controller.currentTab.value
                ? "icon_home_activited.svg"
                : "icon_home.svg",
          ),
          _buildNavigationBarItem(
            "Helpdesk",
            MainTabs.helpdesk == controller.currentTab.value
                ? "icon_inbox_activited.svg"
                : "icon_inbox.svg",
          ),
          // _buildNavigationBarItem(
          //   "Me",
          //   MainTabs.me == controller.currentTab.value
          //       ? "icon_me_activited.svg"
          //       : "icon_me.svg",
          // )
        ],
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: ColorConstants.black,
        currentIndex: controller.getCurrentIndex(controller.currentTab.value),
        selectedItemColor: ColorConstants.black,
        selectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        onTap: (index) => controller.switchTab(index),
      ),
    );
  }

  Widget _buildContent(MainTabs tab) {
    switch (tab) {
      // case MainTabs.home:
      //   return controller.mainTab;
      case MainTabs.info:
        return controller.infoTab;
      case MainTabs.home:
        return controller.mainTab;
      case MainTabs.helpdesk:
        return controller.helpdeskTab;
      default:
        return controller.mainTab;
    }
  }

  BottomNavigationBarItem _buildNavigationBarItem(String label, String svg) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svgs/$svg'),
      label: label,
    );
  }
}
