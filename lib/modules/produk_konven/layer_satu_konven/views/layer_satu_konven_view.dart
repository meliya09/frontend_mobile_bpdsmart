import 'package:bpdsmart_diy/routes/routes.dart';
import 'package:bpdsmart_diy/services/product_konvensional_api/dana_konven_services.dart';
import 'package:bpdsmart_diy/services/product_konvensional_api/jasa_konven_services.dart';
import 'package:bpdsmart_diy/services/product_konvensional_api/kredit_konsumer_service.dart';
import 'package:bpdsmart_diy/services/product_konvensional_api/kredit_konven_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import '../controllers/layer_satu_konven_controller.dart';

class LayerSatuKonvenView extends GetView<LayerSatuKonvenController> {
  LayerSatuKonvenView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data == '7'
              ? 'Dana Konven'
              : data == '8'
                  ? 'Kredit'
                  : data == '9'
                      ? 'Jasa Konven'
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                GetBuilder<LayerSatuKonvenController>(
                  init: LayerSatuKonvenController(),
                  builder: (_) {
                    return nestedFuture();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<Object>> nestedFuture() {
    return FutureBuilder(
      future: data == '7'
          ? DanaKonvenService().getKonvens()
          : data == '8'
              ? KreditKonvenService().getKreditKonvens()
              : data == '9'
                  ? JasaKonvenService().getJasaKonvens()
                  : DanaKonvenService().getKonvens(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                // color: melon,
                margin: const EdgeInsets.all(16),
                child: ListTile(
                  leading: data == '7'
                      ? const Icon(FontAwesomeIcons.wallet, color: Colors.white)
                      : data == '8'
                          ? const Icon(FontAwesomeIcons.creditCard,
                              color: Colors.white)
                          : data == '9'
                              ? const Icon(FontAwesomeIcons.servicestack,
                                  color: Colors.white)
                              : const Icon(FontAwesomeIcons.wallet,
                                  color: Colors.white),
                  title: Text(
                    snapshot.data![index].kontenMenu.toString(),
                    // style: heading1,
                  ),
                  trailing: snapshot.data![index].kategoriNama == 'Produk'
                      ? const Text('Produk')
                      : const Text('Menu'),
                  textColor: Colors.white,
                  onTap: () {
                    if (snapshot.data![index].kategoriNama == 'Produk') {
                      Get.toNamed(
                        Routes.DETAIL_KONVEN,
                        arguments: snapshot.data![index],
                      );
                    } else {
                      Get.toNamed(Routes.LAYER_DUA_KONVEN,
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
  }
}
