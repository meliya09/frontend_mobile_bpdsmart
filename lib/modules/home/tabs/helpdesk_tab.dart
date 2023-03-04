import 'package:bpdsmart_diy/modules/Helpdesk/product/controllers/product_help_controller.dart';
import 'package:bpdsmart_diy/services/helpdesk_api/help_services.dart';
import 'package:bpdsmart_diy/shared/widgets/msg/msg_box.dart';
import 'package:bpdsmart_diy/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class HelpdeskTab extends GetView<ProductHelpController> {
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Helpdesk',
          // style: TextStyle(color: oldLavender),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                GetBuilder<ProductHelpController>(
                  init: ProductHelpController(),
                  builder: (_) {
                    return FutureBuilder(
                      future: HelpService().getHelp(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Center(
                                  child: Container(
                                      width: 300,
                                      height: 130,
                                      padding: new EdgeInsets.all(8.0),
                                      child: Card(
                                        semanticContainer: true,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        elevation: 8,
                                        color: const Color.fromARGB(
                                            255, 194, 190, 231),
                                        margin: const EdgeInsets.all(2),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  const Text(
                                                    'Staff Jabatan :',
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                  Text(
                                                    snapshot.data![index]
                                                        .userJabatan
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                ]),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                const Text(
                                                  'Staff Nama :',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                Text(
                                                  snapshot.data![index].userNama
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                const Text(
                                                  'Staff Email : ',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                Text(
                                                  snapshot
                                                      .data![index].userEmail
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                const Text(
                                                  'Staff Telp : ',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                Text(
                                                  snapshot.data![index].userTelp
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                const Text(
                                                  'Divisi : ',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                Text(
                                                  snapshot
                                                      .data![index].levelNama
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )));
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
                ),
              ],
            ),
          ),
        ),
      ),

      // body: SingleChildScrollView(
      //   padding: const EdgeInsets.all(16),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       GetBuilder<ProductHelpController>(
      //         init: ProductHelpController(),
      //         builder: (_) {
      //           return FutureBuilder(
      //             future: HelpService().getHelp(),
      //             builder: (context, AsyncSnapshot snapshot) {
      //               if (snapshot.hasData) {
      //                 return ListView.builder(
      //                   shrinkWrap: true,
      //                   itemCount: snapshot.data!.length,
      //                   itemBuilder: (context, index) {
      //                     return Center(
      //                         child: Container(
      //                             width: 300,
      //                             height: 130,
      //                             padding: new EdgeInsets.all(8.0),
      //                             child: Card(
      //                               semanticContainer: true,
      //                               clipBehavior: Clip.antiAliasWithSaveLayer,
      //                               shape: RoundedRectangleBorder(
      //                                 borderRadius:
      //                                     BorderRadius.circular(5.0),
      //                               ),
      //                               elevation: 8,
      //                               color: const Color.fromARGB(
      //                                   255, 194, 190, 231),
      //                               margin: const EdgeInsets.all(10),
      //                               child: Column(
      //                                 mainAxisSize: MainAxisSize.min,
      //                                 children: [
      //                                   Row(
      //                                       mainAxisAlignment:
      //                                           MainAxisAlignment
      //                                               .spaceBetween,
      //                                       children: <Widget>[
      //                                         const Text(
      //                                           'Staff Jabatan :',
      //                                           style:
      //                                               TextStyle(fontSize: 15),
      //                                         ),

      //                                         Text(
      //                                           snapshot
      //                                               .data![index].stafJabatan
      //                                               .toString(),
      //                                           style:
      //                                               TextStyle(fontSize: 15),
      //                                         ),

      //                                       ]),
      //                                   Row(
      //                                     mainAxisAlignment:
      //                                         MainAxisAlignment.spaceBetween,
      //                                     children: <Widget>[
      //                                       const Text(
      //                                         'Staff Jabatan :',
      //                                         style: TextStyle(fontSize: 15),
      //                                       ),

      //                                       Text(
      //                                         snapshot
      //                                             .data![index].stafJabatan
      //                                             .toString(),
      //                                         style: TextStyle(fontSize: 15),
      //                                       ),
      //                                     ],
      //                                   ),
      //                                   Row(
      //                                     mainAxisAlignment:
      //                                         MainAxisAlignment.spaceBetween,
      //                                     children: <Widget>[
      //                                       const Text(
      //                                         'Staff Email : ',
      //                                         style: TextStyle(fontSize: 15),
      //                                       ),

      //                                       Text(
      //                                         snapshot.data![index].stafEmail
      //                                             .toString(),
      //                                         style: TextStyle(fontSize: 15),
      //                                       ),
      //                                     ],
      //                                   ),
      //                                   Row(
      //                                     mainAxisAlignment:
      //                                         MainAxisAlignment.spaceBetween,
      //                                     children: <Widget>[
      //                                       const Text(
      //                                         'Staff Telp : ',
      //                                         style: TextStyle(fontSize: 15),
      //                                       ),

      //                                       Text(
      //                                         snapshot.data![index].stafTelp
      //                                             .toString(),
      //                                         style: TextStyle(fontSize: 15),
      //                                       ),
      //                                     ],
      //                                   ),
      //                                   Row(
      //                                     mainAxisAlignment:
      //                                         MainAxisAlignment.spaceBetween,
      //                                     children: <Widget>[
      //                                       const Text(
      //                                         'Divisi : ',
      //                                         style: TextStyle(fontSize: 15),
      //                                       ),

      //                                       Text(
      //                                         snapshot.data![index].levelNama
      //                                             .toString(),
      //                                         style: TextStyle(fontSize: 15),
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ],
      //                               ),
      //                             )));
      //                   },
      //                 );
      //               } else {
      //                 return const Center(
      //                   child: CircularProgressIndicator(),
      //                 );
      //               }
      //             },
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // )
    );
  }
}
