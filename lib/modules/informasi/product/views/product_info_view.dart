import 'package:bpdsmart_diy/routes/routes.dart';
import 'package:bpdsmart_diy/services/informasi_api/info_services.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controllers/product_info_controller.dart';

class ProductInfoView extends GetView<ProductInfoController> {
  const ProductInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Informasi',
            // style: TextStyle(color: oldLavender),
          ),
          // actions: <Widget>[
          //   IconButton(
          //     icon: new Icon(Icons.home, color: Colors.white, size: 30),
          //     onPressed: () {
          //       Get.toNamed(Routes.HOME);
          //     },
          //   ),
          // ],
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<ProductInfoController>(
                init: ProductInfoController(),
                builder: (_) {
                  return FutureBuilder(
                    future: InfoService().getInfo(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              // color: melon,
                              margin: const EdgeInsets.all(16),
                              child: ListTile(
                                leading: snapshot.data![index].kontenId == '77'
                                    ? const Icon(FontAwesomeIcons.mapLocation,
                                        color: Colors.white)
                                    : snapshot.data![index].kontenId == '85'
                                        ? const Icon(
                                            FontAwesomeIcons.mapLocation,
                                            color: Colors.white)
                                        : snapshot.data![index].kontenId == '93'
                                            ? const Icon(
                                                FontAwesomeIcons.mapLocation,
                                                color: Colors.white)
                                            : const Icon(
                                                FontAwesomeIcons.mapLocation,
                                                color: Colors.white),
                                title: Text(
                                    snapshot.data![index].kontenMenu.toString(),
                                    style: TextStyle(color: Colors.white)),

                                trailing: snapshot.data![index].kategoriNama ==
                                        'Lokasi'
                                    ? const Text('Lokasi')
                                    : snapshot.data![index].kategoriNama ==
                                            'News'
                                        ? const Text('News')
                                        : const Text('Lokasi'),
                                textColor: Colors.white,
                                onTap: () {
                                  if (snapshot.data![index].kategoriNama ==
                                      'Lokasi') {
                                    Get.toNamed(
                                      Routes.LAYER_ONE_INFO,
                                      arguments: snapshot.data![index].kontenId,
                                    );
                                  } else if (snapshot
                                          .data![index].kategoriNama ==
                                      'News') {
                                    Get.toNamed(
                                      Routes.DETAIL_PRODUCT_INTERNAL,
                                      arguments: snapshot.data![index].kontenId,
                                    );
                                  } else {
                                    Get.toNamed(Routes.LAYER_ONE_INFO,
                                        arguments:
                                            snapshot.data![index].kontenId);
                                  }
                                },
                                // trailing:
                                //     snapshot.data![index].kontenMenu == 'Lokasi'
                                //         ? const Text('Lokasi')
                                //         : const Text('Lokasi'),
                                // textColor: Colors.white,
                                // onTap: () {
                                //   Get.toNamed(Routes.LAYER_ONE_INFO,
                                //       arguments:
                                //           snapshot.data![index].kontenId);
                                // },
                              ),
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
              ),
            ],
          ),
        ));
  }
}
