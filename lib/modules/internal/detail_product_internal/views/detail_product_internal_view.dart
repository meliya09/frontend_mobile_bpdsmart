import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/material.dart';
import 'package:bpdsmart_diy/routes/routes.dart';
import 'package:bpdsmart_diy/services/internal_api/berita_terkini_services.dart';
import 'package:bpdsmart_diy/services/internal_api/info_manajemen_services.dart';
import 'package:bpdsmart_diy/services/internal_api/internal_services.dart';
import 'package:bpdsmart_diy/models/Internal/internal.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:http/http.dart';

import '../controllers/detail_product_internal_controller.dart';

class DetailProductInternalView
    extends GetView<DetailProductInternalController> {
  DetailProductInternalView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            data == '93'
                ? 'Berita Terkini'
                // : data == '94'
                //     ? 'Info Manajemen'
                : 'Tidak ada judul',
          ),
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.home, color: Colors.white, size: 30),
              onPressed: () {
                Get.toNamed(Routes.HOME);
              },
            ),
          ],
          // title: Text('Berita Terkini'),
          centerTitle: true,
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
                // Center(
                //   child: Card(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(15.0),
                //     ),
                //     child: data.kontenGambar == null
                //         ? ClipRRect(
                //             borderRadius: BorderRadius.circular(15.0),
                //             child: Image.network(
                //               'https://via.placeholder.com/450x200.png',
                //               width: 450,
                //               height: 200,
                //               fit: BoxFit.cover,
                //             ),
                //           )
                //         : ClipRRect(
                //             borderRadius: BorderRadius.circular(15.0),
                //             child: Image.network(
                //               '${baseUrl}images/${data.kontenGambar}',
                //               width: 450,
                //               height: 200,
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 25.0,
                // ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 185, 174, 174),
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: TabBar(
                    isScrollable: true,
                    controller: controller.tabController,
                    // give the indicator a decoration (color and border radius)
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      color: Colors.blue[900],
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                        text: 'Judul Berita',
                        height: 100,
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      GetBuilder<DetailProductInternalController>(
                        init: DetailProductInternalController(),
                        builder: (_) {
                          return FutureBuilder(
                            future: data == '93'
                                ? BeritaTerkiniService().getBeritaTerkini()
                                // : data == '94'
                                //     ? InfoManajemenService()
                                //         .getInternals()
                                : BeritaTerkiniService().getBeritaTerkini(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      clipBehavior: Clip.antiAlias,
                                      color: Color.fromARGB(255, 209, 201, 201),
                                      margin: const EdgeInsets.all(8),
                                      child: ListTile(
                                          leading: data == '93'
                                              ? const Icon(
                                                  FontAwesomeIcons.newspaper,
                                                  color: Colors.white)
                                              // : data == '94'
                                              //     ? const Icon(
                                              //         FontAwesomeIcons
                                              //             .newspaper,
                                              //         color: Colors.white)
                                              : const Icon(
                                                  FontAwesomeIcons.newspaper,
                                                  color: Colors.white),
                                          title: Text(
                                            snapshot.data![index].kontenJudul
                                                .toString(),

                                            // style: heading1,
                                          ),
                                          trailing: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                  FontAwesomeIcons.arrowRight,
                                                  color: Colors.white),
                                              Text(
                                                'Lihat Detail',
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            if (snapshot.data![index]
                                                        .kontenDeskripsi ==
                                                    null ||
                                                snapshot.data![index]
                                                        .kontenDeskripsi ==
                                                    '' ||
                                                snapshot.data![index]
                                                        .kontenDeskripsi ==
                                                    'null') {
                                              Get.snackbar(
                                                'Perhatian',
                                                'Belum ada konten',
                                                snackPosition:
                                                    SnackPosition.TOP,
                                                backgroundColor: Colors.red,
                                                colorText: Colors.white,
                                              );
                                            } else {
                                              Get.toNamed(
                                                Routes.DETAIL_PRODUCT_BERITA,
                                                arguments:
                                                    snapshot.data![index],
                                              );
                                            }
                                          }),
                                    );
                                  },
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
                // Expanded(
                //   child: TabBarView(
                //     controller: controller.tabController,
                //     children: [
                //       SingleChildScrollView(
                //         child: Column(
                //           children: [
                //             GetBuilder<DetailProductInternalController>(
                //               init: DetailProductInternalController(),
                //               builder: (_) {
                //                 scrollDirection:
                //                 Axis.horizontal;
                //                 return FutureBuilder(
                //                   future: data == '93'
                //                       ? BeritaTerkiniService()
                //                           .getBeritaTerkini()
                //                       // : data == '94'
                //                       //     ? InfoManajemenService()
                //                       //         .getInternals()
                //                       : BeritaTerkiniService()
                //                           .getBeritaTerkini(),
                //                   builder: (context, AsyncSnapshot snapshot) {
                //                     if (snapshot.hasData) {
                //                       return ListView.builder(
                //                         shrinkWrap: true,
                //                         itemCount: snapshot.data!.length,
                //                         itemBuilder: (context, index) {
                //                           return Card(
                //                             clipBehavior: Clip.antiAlias,
                //                             color: Color.fromARGB(
                //                                 255, 209, 201, 201),
                //                             margin: const EdgeInsets.all(8),
                //                             child: ListTile(
                //                                 leading: data == '93'
                //                                     ? const Icon(
                //                                         FontAwesomeIcons
                //                                             .newspaper,
                //                                         color: Colors.white)
                //                                     // : data == '94'
                //                                     //     ? const Icon(
                //                                     //         FontAwesomeIcons
                //                                     //             .newspaper,
                //                                     //         color: Colors.white)
                //                                     : const Icon(
                //                                         FontAwesomeIcons
                //                                             .newspaper,
                //                                         color: Colors.white),
                //                                 title: Text(
                //                                   snapshot
                //                                       .data![index].kontenJudul
                //                                       .toString(),

                //                                   // style: heading1,
                //                                 ),
                //                                 trailing: Column(
                //                                   mainAxisAlignment:
                //                                       MainAxisAlignment.center,
                //                                   children: [
                //                                     const Icon(
                //                                         FontAwesomeIcons
                //                                             .arrowRight,
                //                                         color: Colors.white),
                //                                     Text(
                //                                       'Lihat Detail',
                //                                     ),
                //                                   ],
                //                                 ),
                //                                 onTap: () {
                //                                   if (snapshot.data![index]
                //                                               .kontenDeskripsi ==
                //                                           null ||
                //                                       snapshot.data![index]
                //                                               .kontenDeskripsi ==
                //                                           '' ||
                //                                       snapshot.data![index]
                //                                               .kontenDeskripsi ==
                //                                           'null') {
                //                                     Get.snackbar(
                //                                       'Perhatian',
                //                                       'Belum ada konten',
                //                                       snackPosition:
                //                                           SnackPosition.TOP,
                //                                       backgroundColor:
                //                                           Colors.red,
                //                                       colorText: Colors.white,
                //                                     );
                //                                   } else {
                //                                     Get.toNamed(
                //                                       Routes
                //                                           .DETAIL_PRODUCT_BERITA,
                //                                       arguments:
                //                                           snapshot.data![index],
                //                                     );
                //                                   }
                //                                 }
                //                                 // trailing: data.kategoriNama ==
                //                                 //         "News"
                //                                 //     ? const Icon(
                //                                 //         FontAwesomeIcons
                //                                 //             .arrowRight,
                //                                 //         color: Colors.white)
                //                                 //     : Column(
                //                                 //         mainAxisAlignment:
                //                                 //             MainAxisAlignment
                //                                 //                 .center,
                //                                 //         children: [
                //                                 //           const Icon(
                //                                 //               FontAwesomeIcons
                //                                 //                   .arrowRight,
                //                                 //               color:
                //                                 //                   Colors.white),
                //                                 //           Text(
                //                                 //             'Lihat Detail',
                //                                 //           ),
                //                                 //         ],
                //                                 //       ),
                //                                 // onTap: () {
                //                                 //   Get.toNamed(
                //                                 //     Routes.DETAIL_PRODUCT_BERITA,
                //                                 //     arguments:
                //                                 //         snapshot.data![index],
                //                                 //   );
                //                                 // },
                //                                 // trailing: snapshot.data![index].kontenJudul ==
                //                                 //     'News'
                //                                 // ? const Text('News')
                //                                 // : snapshot.data![index].kategoriNama == 'Info'
                //                                 //     ? const Text('Info')
                //                                 //     : const Text('Menu'),
                //                                 // onTap: () {
                //                                 //   Get.toNamed(
                //                                 //       Routes
                //                                 //           .DETAIL_PRODUCT_BERITA,
                //                                 //       arguments: snapshot
                //                                 //           .data![index]);
                //                                 // },
                //                                 ),
                //                           );
                //                         },
                //                       );
                //                     } else {
                //                       return const Center(
                //                         child: CircularProgressIndicator(),
                //                       );
                //                     }
                //                   },
                //                 );
                //               },
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}
