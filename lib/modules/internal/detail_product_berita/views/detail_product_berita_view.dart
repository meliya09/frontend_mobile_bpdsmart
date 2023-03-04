import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/material.dart';
import 'package:bpdsmart_diy/services/internal_api/berita_terkini_services.dart';
import 'package:bpdsmart_diy/services/internal_api/info_manajemen_services.dart';
import 'package:bpdsmart_diy/services/internal_api/internal_services.dart';
import 'package:bpdsmart_diy/models/Internal/berita_terkini.dart';
import 'package:bpdsmart_diy/services/internal_api/berita_terkini_services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';

import '../../../../app/routes/app_pages.dart';
import '../controllers/detail_product_berita_controller.dart';

class DetailProductBeritaView extends GetView<DetailProductBeritaController> {
  DetailProductBeritaView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Berita'),
          // title: Text(data.kontenSubjudul),
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.home, color: Colors.white, size: 30),
              onPressed: () {
                Get.toNamed(Routes.HOME);
              },
            ),
          ],
          // title: Text(
          //   data.kontenSubjudul,
          //   style: TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
          // centerTitle: true,
        ),
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        data.kontenJudul,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: data.kontenGambar == null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network(
                                    'https://via.placeholder.com/450x200.png',
                                    width: 450,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network(
                                    '${baseUrl}images/${data.kontenGambar}',
                                    width: 450,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Html(
                        data: data.kontenDeskripsi,
                        style: {
                          "html": Style(
                            fontSize: FontSize(14.0),
                            fontWeight: FontWeight.w400,
                          ),
                        },
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),

                      // Container(
                      //   height: 45,
                      //   decoration: BoxDecoration(
                      //     // color: melon,
                      //     borderRadius: BorderRadius.circular(
                      //       25.0,
                      //     ),
                      //   ),
                      //   child: const Center(
                      //     child: Text(
                      //       'DESKRIPSI',
                      //       style: TextStyle(
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.bold,
                      //         fontFamily: 'RobotoMono',
                      //         color: Color.fromARGB(255, 22, 7, 233),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ])))

        // body: SafeArea(
        //     child: Container(
        //   padding: const EdgeInsets.all(16),
        //   child:
        //       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //     const SizedBox(
        //       height: 25,
        //     ),
        //     Text(
        //       data.kontenJudul,
        //       style: TextStyle(
        //         fontSize: 16,
        //         fontWeight: FontWeight.w600,
        //       ),
        //     ),
        //     const SizedBox(
        //       height: 25,
        //     ),

        //     Text(
        //       data.kontenDeskripsi,
        //       style: TextStyle(
        //         fontSize: 14,
        //         fontWeight: FontWeight.w400,
        //       ),
        //     ),
        //   ]),
        // ))
        // body: SafeArea(
        //   child: Container(
        //     padding: const EdgeInsets.all(16),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         const SizedBox(
        //           height: 25,
        //         ),
        //         Center(
        //           child: Card(
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(15.0),
        //             ),
        //             child: data.kontenGambar == null
        //                 ? ClipRRect(
        //                     borderRadius: BorderRadius.circular(15.0),
        //                     child: Image.network(
        //                       'https://via.placeholder.com/450x200.png',
        //                       width: 450,
        //                       height: 200,
        //                       fit: BoxFit.cover,
        //                     ),
        //                   )
        //                 : ClipRRect(
        //                     borderRadius: BorderRadius.circular(15.0),
        //                     child: Image.network(
        //                       '${baseUrl}images/${data.kontenGambar}',
        //                       width: 450,
        //                       height: 200,
        //                       fit: BoxFit.cover,
        //                     ),
        //                   ),
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 25.0,
        //         ),
        //         Container(
        //           height: 45,
        //           decoration: BoxDecoration(
        //             // color: melon,
        //             borderRadius: BorderRadius.circular(
        //               25.0,
        //             ),
        //           ),
        //           // child: const Center(
        //           //   child: Text(
        //           //     'DESKRIPSI',
        //           //     style: TextStyle(
        //           //       fontSize: 20,
        //           //       fontWeight: FontWeight.bold,
        //           //       fontFamily: 'RobotoMono',
        //           //       color: Color.fromARGB(255, 22, 7, 233),
        //           //     ),
        //           //   ),
        //           // ),

        //           child: TabBar(
        //             isScrollable: true,
        //             controller: controller.tabController,
        //             // give the indicator a decoration (color and border radius)
        //             indicator: BoxDecoration(
        //               borderRadius: BorderRadius.circular(
        //                 25.0,
        //               ),
        //               color: Colors.blue[900],
        //             ),
        //             labelColor: Colors.white,
        //             unselectedLabelColor: Colors.black,
        //             tabs: const [
        //               Tab(
        //                 text: 'Judul',
        //                 height: 100,
        //               ),
        //               Tab(
        //                 text: 'Deskripsi',
        //                 height: 100,
        //               ),
        //             ],
        //           ),
        //         ),
        //         Expanded(
        //           child: TabBarView(
        //             controller: controller.tabController,
        //             children: [
        //               SingleChildScrollView(
        //                 child: Column(
        //                   children: [
        //                     const SizedBox(
        //                       height: 25.0,
        //                     ),
        //                     SizedBox(
        //                       width: 350,
        //                       child: Text(
        //                         data.kontenJudul,
        //                         // style: text,
        //                         textAlign: TextAlign.left,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               SingleChildScrollView(
        //                 child: Column(
        //                   children: [
        //                     const SizedBox(
        //                       height: 25.0,
        //                     ),
        //                     SizedBox(
        //                       width: 350,
        //                       child: Text(
        //                         data.kontenDeskripsi,
        //                         // style: text,
        //                         textAlign: TextAlign.left,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // )
        );
  }
}
