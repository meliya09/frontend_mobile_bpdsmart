import 'package:bpdsmart_diy/routes/routes.dart';
import 'package:bpdsmart_diy/services/informasi_api/jaringan_layanan_services.dart';
import 'package:bpdsmart_diy/services/informasi_api/lokasi_atm_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import '../controllers/layer_one_info_controller.dart';

class LayerOneInfoView extends GetView<LayerOneInfoController> {
  LayerOneInfoView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data == '77'
              ? 'Jaringan Pelayanan'
              : data == '85'
                  ? 'Lokasi ATM'
                  : 'Tidak ada judul',
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<LayerOneInfoController>(
              init: LayerOneInfoController(),
              builder: (_) {
                return FutureBuilder(
                  future: data == '77'
                      ? JaringanLayananService().getJaringanLayanan()
                      : data == '85'
                          ? LokasiATMService().getLokasiATM()
                          : JaringanLayananService().getJaringanLayanan(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            // color: melon,
                            margin: const EdgeInsets.all(16),
                            child: ListTile(
                              leading: data == '77'
                                  ? const Icon(FontAwesomeIcons.mapLocation,
                                      color: Colors.white)
                                  : data == '85'
                                      ? const Icon(FontAwesomeIcons.mapLocation,
                                          color: Colors.white)
                                      : const Icon(FontAwesomeIcons.mapLocation,
                                          color: Colors.white),
                              title: Text(
                                snapshot.data![index].lokasiNama.toString(),
                                // style: heading1,
                              ),
                              trailing:
                                  snapshot.data![index].kategoriNama == 'Lokasi'
                                      ? const Text('Lokasi')
                                      : const Text('Lokasi'),
                              textColor: Colors.white,
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_PRODUCT_INFO,
                                    arguments: snapshot.data![index]);
                                // if (snapshot.data![index].kategoriNama ==
                                //     'Lokasi') {
                                //   Get.toNamed(
                                //     Routes.DETAIL_PRODUCT_INFO,
                                //     arguments: snapshot.data![index],
                                //   );
                                // } else {
                                //   Get.toNamed(Routes.DETAIL_PRODUCT_INFO,
                                //       arguments: snapshot.data![index]);
                                // }
                              },
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
      ),
    );
  }
}
