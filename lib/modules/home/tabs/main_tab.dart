import 'package:bpdsmart_diy/modules/home/components/berita_slider_data_found.dart';
import 'package:bpdsmart_diy/modules/home/components/berita_loading.dart';
import 'package:bpdsmart_diy/modules/home/home.dart';
import 'package:bpdsmart_diy/modules/home/home_controller.dart';
import 'package:bpdsmart_diy/routes/app_pages.dart';
import 'package:bpdsmart_diy/services/infoberita/infoberita_api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/widgets/color_button.dart';
import '../../../common/style.dart';
import '../../../shared/utils/size_config.dart';
import '../../../shared/widgets/gradient_background.dart';
import '../../search_menu/views/search_data_views.dart';
import 'failure_view.dart';

class MainTab extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
              _userProfile(),
              _titleBanner(),
              Obx(
                () {
                  if (controller.isBeritaLoading.value) {
                    return const Center(
                      child: BeritaLoading(),
                    );
                  } else {
                    if (controller.beritaItemList.isNotEmpty) {
                      return BeritaSliderDataFound(
                          data: controller.beritaItemList);
                    } else {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.hourglass_empty),
                            Text("Data not found!")
                          ],
                        ),
                      );
                    }
                  }
                },
              ),

              _titleMenu(),
              // _categoriesWidget1(),
              _menu(),
            ])),
      ],
    );
  }
}

Widget _userProfile() {
  return Container(
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
        color: Colors.blue[900],
        // color: Colors.transparent,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        )),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Wellcome, ',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'BPD DIY SMART',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ],
              ),
            ]),
          ],
        ),
        const SizedBox(height: 16.0),
        Container(
          // margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(18.0)),
          ),
          child: TextField(
              decoration: const InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  hintStyle: TextStyle(color: Colors.grey)),
              onChanged: (String newValue) {}),
        ),
      ],
    ),
  );
}

Widget _titleMenu() {
  return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Category",
              style: GoogleFonts.asap(
                textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900]),
              ))));
}

Widget _menu() {
  return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Get.toNamed('/product_konven');
                    },
                    child: Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                        // color: const Color(0xff7c94b6),
                        color: Colors.black,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.dstATop),
                          image: const AssetImage(
                            'assets/images/categories/product_konven.png',
                          ),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Icon(
                          //   Icons.account_balance,
                          //   color: Colors.white,
                          //   size: 40,
                          // ),
                          // SizedBox(height: 10),
                          Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                'Produk',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              )),
                          Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                'Konvensional',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
            Row(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Get.toNamed('/product_syariah');
                    },
                    child: Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                        // color: const Color(0xff7c94b6),
                        color: Colors.black,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.dstATop),
                          image: const AssetImage(
                            'assets/images/categories/product_konven.png',
                          ),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Icon(
                          //   Icons.account_balance,
                          //   color: Colors.white,
                          //   size: 40,
                          // ),
                          // SizedBox(height: 10),
                          Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                'Produk',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              )),
                          Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                'Syariah',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
            Row(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Get.toNamed('/simulasi');
                    },
                    child: Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                        // color: const Color(0xff7c94b6),
                        color: Colors.black,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.dstATop),
                          image: const AssetImage(
                            'assets/images/categories/simulasi.jpg',
                          ),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      // decoration: BoxDecoration(
                      //   color: Colors.blue[900],
                      //   borderRadius: BorderRadius.circular(10),
                      // ),

                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Icon(
                          //   Icons.account_balance,
                          //   color: Colors.white,
                          //   size: 40,
                          // ),
                          // SizedBox(height: 10),
                          Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                'Simulasi',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              )),

                          // Text(
                          //   'Produk \nKonvensional',
                          //   style: GoogleFonts.poppins(
                          //       textStyle: TextStyle(
                          //           fontSize: 14,
                          //           fontWeight: FontWeight.bold,
                          //           color: Colors.white)),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ],
        ),
      ]));
}

Widget _categoriesWidget1() {
  List<Widget> list = [];
  for (int i = 0; i <= 2; i++) {
    list.add(InkWell(
        onTap: () {
          if (i == 0) {
            Get.toNamed('/product_konven');
          }
          if (i == 1) {
            Get.toNamed('/product_syariah');
          }
          if (i == 2) {
            Get.toNamed('/simulasi');
          }
        },
        child: _singleCategory1(i)));
    // list.add(SizedBox(width: MySize.size24));
  }

  // * Add Show All Categories Menu
  return Container(
    // padding: Spacing.only(top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list,
    ),
  );
}

Widget _singleCategory1(int index) {
  List imgCategoryList1 = [
    'assets/images/categories/checklist.png',
    'assets/images/categories/checklist.png',
    'assets/images/categories/credit-card.png',
  ];
  List nameCategoryList1 = [
    'Produk Konvensional',
    'Produk Syariah ',
    'Simulasi',
  ];

  return Container(
    // child: SizedBox(
    //   width: 100,
    //   child: Card(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     elevation: 10,
    //     child: ClipRRect(
    //       borderRadius: BorderRadius.circular(10),
    //       child: Stack(
    //         children: [
    //           Container(
    //             decoration: const BoxDecoration(
    //               // Gradient color
    //               gradient: LinearGradient(
    //                 begin: Alignment.topLeft,
    //                 end: Alignment.bottomRight,
    //                 colors: [
    //                   Colors.blue,
    //                   primaryColor,
    //                 ],
    //               ),
    //             ),
    //             child: Image.asset(
    //               imgCategoryList1[index],
    //               // fit: BoxFit.cover,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),

    child: Column(
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            // color: themeData.colorScheme.primary.withAlpha(20),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            imgCategoryList1[index],
            fit: BoxFit.cover,
          ),
          // padding: Spacing.all(15),
        ),
        Container(
          width: 100,
          // padding: top(8),
          child: Text(
            nameCategoryList1[index],
            maxLines: 2,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
            // style: AppTheme.getTextStyle(themeData.textTheme.caption,
            //     fontWeight: 600, letterSpacing: 0),
          ),
        )
      ],
    ),
  );
}

Widget _titleBanner() {
  return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Informasi & Berita",
              style: GoogleFonts.asap(
                textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900]),
              ))));
}
