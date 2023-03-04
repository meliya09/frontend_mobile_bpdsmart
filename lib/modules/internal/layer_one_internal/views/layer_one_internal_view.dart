import 'package:bpdsmart_diy/routes/routes.dart';
import 'package:bpdsmart_diy/services/internal_api/std_layanan_services.dart';
import 'package:bpdsmart_diy/services/internal_api/bdy_kerja_services.dart';
import 'package:bpdsmart_diy/services/internal_api/berita_terkini_services.dart';
import 'package:bpdsmart_diy/services/internal_api/info_manajemen_services.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import '../controllers/layer_one_internal_controller.dart';

class LayerOneInternalView extends GetView<LayerOneInternalController> {
  LayerOneInternalView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data == '95'
              ? 'Standar Layanan'
              : data == '96'
                  ? 'Budaya Kerja'
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
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<LayerOneInternalController>(
              init: LayerOneInternalController(),
              builder: (_) {
                return FutureBuilder(
                  future: data == '95'
                      ? StdLayananService().getStdLayanan()
                      : data == '96'
                          ? BdyKerjaService().getBdyKerja()
                          : StdLayananService().getStdLayanan(),
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
                              leading: data == '95'
                                  ? const Icon(FontAwesomeIcons.userGroup,
                                      color: Colors.white)
                                  : data == '96'
                                      ? const Icon(FontAwesomeIcons.userGroup,
                                          color: Colors.white)
                                      : const Icon(FontAwesomeIcons.userGroup,
                                          color: Colors.white),
                              title: Text(
                                snapshot.data![index].kontenMenu.toString(),
                                // style: heading1,
                              ),
                              trailing: snapshot.data![index].kategoriNama ==
                                      'News'
                                  ? const Text('News')
                                  : snapshot.data![index].kategoriNama == 'Info'
                                      ? const Text('Info')
                                      : const Text('Menu'),
                              textColor: Colors.white,
                              onTap: () {
                                if (snapshot.data![index].kategoriNama ==
                                    'News') {
                                  Get.toNamed(
                                    Routes.DETAIL_PRODUCT_INTERNAL,
                                    arguments: snapshot.data![index],
                                  );
                                } else if (snapshot.data![index].kategoriNama ==
                                    'Info') {
                                  Get.toNamed(
                                    Routes.DETAIL_PRODUCT2_INTERNAL,
                                    arguments: snapshot.data![index],
                                  );
                                } else {
                                  Get.toNamed(Routes.LAYER_TWO_INTERNAL,
                                      arguments: snapshot.data![index]);
                                }
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
