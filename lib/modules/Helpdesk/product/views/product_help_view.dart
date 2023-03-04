import 'package:bpdsmart_diy/routes/routes.dart';
import 'package:bpdsmart_diy/services/helpdesk_api/help_services.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controllers/product_help_controller.dart';

class ProductHelpView extends GetView<ProductHelpController> {
  const ProductHelpView({Key? key}) : super(key: key);
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
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Center(
                                child: Container(
                                    width: 300,
                                    height: 130,
                                    padding: new EdgeInsets.all(8.0),
                                    child: Card(
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      elevation: 8,
                                      color: const Color.fromARGB(
                                          255, 194, 190, 231),
                                      margin: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
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
                                                  snapshot
                                                      .data[index].userJabatan,
                                                ),
                                              ]),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const Text(
                                                'Staff Nama :',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              // const Text(
                                              //   ':',
                                              // ),
                                              Text(
                                                snapshot.data[index].userNama,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const Text(
                                                'Staff Email : ',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              // const Text(
                                              //   ':',
                                              // ),
                                              Text(
                                                snapshot.data[index].userEmail,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const Text(
                                                'Staff Telp : ',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              // const Text(
                                              //   ':',
                                              // ),
                                              Text(
                                                snapshot.data[index].userTelp,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const Text(
                                                'Divisi : ',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              // const Text(
                                              //   ':',
                                              // ),
                                              Text(
                                                snapshot.data[index].levelId,
                                                style: TextStyle(fontSize: 15),
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
        ));
  }
}

                        

                          // return Card(
                          //     semanticContainer: true,
                          //     clipBehavior: Clip.antiAliasWithSaveLayer,
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(10.0),
                          //     ),
                          //     elevation: 5,
                          //     color: const Color.fromARGB(255, 194, 190, 231),
                          //     margin: const EdgeInsets.all(10),
                          //     child: Column(
                          //       children: [
                          //         // const SizedBox(
                          //         //   height: 20.0,
                          //         // ),
                          //         // SizedBox(
                          //         //   width: 100,
                          //         //   child: Text(
                          //         //     snapshot.data![index].stafNama
                          //         //         .toString(),
                          //         //     // style: text,
                          //         //     textAlign: TextAlign.left,
                          //         //   ),
                          //         // ),
                          //         Row(
                          //             // mainAxisAlignment:
                          //             //     MainAxisAlignment.spaceBetween,
                          //             children: <Widget>[
                          //               const Align(
                          //                 alignment: Alignment.center,
                          //                 child: Text(
                          //                   'Staff Nama',
                          //                 ),
                          //               ),
                          //               const Align(
                          //                 alignment: Alignment.center,
                          //                 child: Text(
                          //                   ':',
                          //                 ),
                          //               ),
                          //               Align(
                          //                 alignment: Alignment.center,
                          //                 child: Text(
                          //                   snapshot.data![index].stafNama
                          //                       .toString(),
                          //                 ),
                          //               )
                          //             ]),
                          //         Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceBetween,
                          //           children: <Widget>[
                          //             const Text(
                          //               'Staff Jabatan',
                          //             ),
                          //             const Text(
                          //               ':',
                          //             ),
                          //             Text(
                          //               snapshot.data![index].stafJabatan
                          //                   .toString(),
                          //             ),
                          //           ],
                          //         ),
                          //         Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceBetween,
                          //           children: <Widget>[
                          //             const Text(
                          //               'Staff Email',
                          //             ),
                          //             const Text(
                          //               ':',
                          //             ),
                          //             Text(
                          //               snapshot.data![index].stafEmail
                          //                   .toString(),
                          //             ),
                          //           ],
                          //         ),
                          //         Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceBetween,
                          //           children: <Widget>[
                          //             const Text(
                          //               'Staff Telp',
                          //             ),
                          //             const Text(
                          //               ':',
                          //             ),
                          //             Text(
                          //               snapshot.data![index].stafTelp
                          //                   .toString(),
                          //             ),
                          //           ],
                          //         ),
                          //         Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceBetween,
                          //           children: <Widget>[
                          //             const Text(
                          //               'Divisi',
                          //             ),
                          //             const Text(
                          //               ':',
                          //             ),
                          //             Text(
                          //               snapshot.data![index].levelNama
                          //                   .toString(),
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     ));
                          // },
                        // );
//                       } else {
//                         return const Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         ));
//   }
// }
