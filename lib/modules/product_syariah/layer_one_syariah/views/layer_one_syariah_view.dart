import 'package:bpdsmart_diy/routes/routes.dart';
import 'package:bpdsmart_diy/services/product_syariah_api/dana_syariah_services.dart';
import 'package:bpdsmart_diy/services/product_syariah_api/jasa_syariah_services.dart';
import 'package:bpdsmart_diy/services/product_syariah_api/pembiayaan_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import '../controllers/layer_one_syariah_controller.dart';

class LayerOneSyariahView extends GetView<LayerOneSyariahController> {
  LayerOneSyariahView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data == '45'
              ? 'Dana Syariah'
              : data == '46'
                  ? 'Pembiayaan'
                  : data == '47'
                      ? 'Jasa Syariah'
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
                GetBuilder<LayerOneSyariahController>(
                  init: LayerOneSyariahController(),
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
      future: data == '45'
          ? DanaSyariahService().getSyariahs()
          : data == '46'
              ? PembiayaanService().getSyariahs()
              : data == '47'
                  ? JasaSyariahService().getJasaSyariah()
                  : DanaSyariahService().getSyariahs(),
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
                  leading: data == '45'
                      ? const Icon(FontAwesomeIcons.wallet, color: Colors.white)
                      : data == '46'
                          ? const Icon(FontAwesomeIcons.creditCard,
                              color: Colors.white)
                          : data == '47'
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
                        Routes.DETAIL_PRODUCT_SYARIAH,
                        arguments: snapshot.data![index],
                      );
                    } else {
                      Get.toNamed(Routes.LAYER_TWO_SYARIAH,
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
