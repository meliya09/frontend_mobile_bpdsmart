// import 'package:bpdsmart_diy/modules/informasi/product/controllers/product_info_controller.dart';
// import 'package:bpdsmart_diy/routes/app_pages.dart';
// import 'package:bpdsmart_diy/services/informasi_api/info_services.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:get/get_navigation/src/snackbar/snackbar.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';

// import '../../../services/internal_api/berita_terkini_services.dart';
// import '../../internal/detail_product_internal/controllers/detail_product_internal_controller.dart';
// import '../../internal/detail_product_internal/views/detail_product_internal_view.dart';
// import '../../internal/detail_product_internal/bindings/detail_product_internal_binding.dart';
// import '../../internal/detail_product_berita/controllers/detail_product_berita_controller.dart';
// import '../../internal/detail_product_berita/views/detail_product_berita_view.dart';
// import '../../internal/detail_product_berita/bindings/detail_product_berita_binding.dart';

// import 'package:bpdsmart_diy/shared/constants/common.dart';
// import 'package:flutter/material.dart';
// import 'package:bpdsmart_diy/services/internal_api/berita_terkini_services.dart';
// import 'package:bpdsmart_diy/services/internal_api/internal_services.dart';
// import 'package:bpdsmart_diy/models/Internal/internal.dart';
// import 'package:flutter_html/flutter_html.dart';

// import 'package:http/http.dart';

// class InformasiTab extends GetView<ProductInfoController> {
//   final data = Get.arguments;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Informasi',
//             // style: TextStyle(color: oldLavender),
//           ),
//           actions: <Widget>[
//             IconButton(
//               icon: new Icon(Icons.home, color: Colors.white, size: 30),
//               onPressed: () {
//                 Get.toNamed(Routes.HOME);
//               },
//             ),
//           ],
//           centerTitle: true,
//         ),
//         body: Container(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               GetBuilder<ProductInfoController>(
//                 init: ProductInfoController(),
//                 builder: (_) {
//                   return FutureBuilder(
//                     future: InfoService().getInfo(),
//                     builder: (context, AsyncSnapshot snapshot) {
//                       if (snapshot.hasData) {
//                         return ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: snapshot.data!.length,
//                           itemBuilder: (context, index) {
//                             return Card(
//                               // color: melon,
//                               margin: const EdgeInsets.all(16),
//                               child: ListTile(
//                                 leading: snapshot.data![index].kontenId == '77'
//                                     ? const Icon(FontAwesomeIcons.mapLocation,
//                                         color: Colors.white)
//                                     : snapshot.data![index].kontenId == '85'
//                                         ? const Icon(
//                                             FontAwesomeIcons.mapLocation,
//                                             color: Colors.white)
//                                         : snapshot.data![index].kontenId == '93'
//                                             ? const Icon(
//                                                 FontAwesomeIcons.newspaper,
//                                                 color: Colors.white)
//                                             : const Icon(
//                                                 FontAwesomeIcons.mapLocation,
//                                                 color: Colors.white),
//                                 title: Text(
//                                     snapshot.data![index].kontenMenu.toString(),
//                                     style: TextStyle(color: Colors.white)),

//                                 trailing: snapshot.data![index].kategoriNama ==
//                                         'Lokasi'
//                                     ? const Text('Lokasi')
//                                     : snapshot.data![index].kategoriNama ==
//                                             'News'
//                                         ? const Text('News')
//                                         : const Text('Lokasi'),
//                                 textColor: Colors.white,
//                                 onTap: () {
//                                   if (snapshot.data![index].kategoriNama ==
//                                       'Lokasi') {
//                                     Get.toNamed(
//                                       Routes.LAYER_ONE_INFO,
//                                       arguments: snapshot.data![index].kontenId,
//                                     );
//                                   } else if (snapshot
//                                           .data![index].kategoriNama ==
//                                       'News') {
//                                     Get.toNamed(
//                                       Routes.DETAIL_PRODUCT_INTERNAL,
//                                       arguments: snapshot.data![index].kontenId,
//                                     );
//                                   } else {
//                                     Get.toNamed(Routes.LAYER_ONE_INFO,
//                                         arguments:
//                                             snapshot.data![index].kontenId);
//                                   }
//                                 },
//                                 // trailing:
//                                 //     snapshot.data![index].kontenMenu == 'Lokasi'
//                                 //         ? const Text('Lokasi')
//                                 //         : const Text('Lokasi'),
//                                 // textColor: Colors.white,
//                                 // onTap: () {
//                                 //   Get.toNamed(Routes.LAYER_ONE_INFO,
//                                 //       arguments:
//                                 //           snapshot.data![index].kontenId);
//                                 // },
//                               ),
//                             );
//                           },
//                         );
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
