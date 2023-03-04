import 'package:bpdsmart_diy/routes/routes.dart';
import 'package:bpdsmart_diy/services/product_syariah_api/deposito_konven._services.dart';
import 'package:bpdsmart_diy/services/product_syariah_api/giro_syariah_services.dart';
import 'package:bpdsmart_diy/services/product_syariah_api/kiriman_uang_syariah_services.dart';
import 'package:bpdsmart_diy/services/product_syariah_api/modal_kerja_services.dart';
import 'package:bpdsmart_diy/services/product_syariah_api/investasi_services.dart';
import 'package:bpdsmart_diy/services/product_syariah_api/pembiayaan_services.dart';
import 'package:bpdsmart_diy/services/product_syariah_api/tabungan_syariah_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/layer_two_syariah_controller.dart';

class LayerTwoSyariahView extends GetView<LayerTwoSyariahController> {
  LayerTwoSyariahView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleText(data: data),
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
                GetBuilder<LayerTwoSyariahController>(
                  init: LayerTwoSyariahController(),
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
      future: data.kontenId == '48'
          ? TabunganSyariahService().getTabunganSyariah()
          : data.kontenId == '49'
              ? GiroSyariahService().getSyariahs()
              : data.kontenId == '50'
                  ? DepositoSyariahService().getSyariahs()
                  // : data.kontenId == '46'
                  //     ? PembiayaanService().getPembiayaan()
                  : data.kontenId == '64'
                      ? ModalKerjaServices().getSyariahs()
                      : data.kontenId == '65'
                          ? InvestasiServices().getSyariahs()
                          : data.kontenId == '73'
                              ? KirimanUangSyariahServices().getSyariahs()
                              : TabunganSyariahService().getTabunganSyariah(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                // color: ThemeData,
                margin: const EdgeInsets.all(16),
                child: ListTile(
                  leading: data.kontenId == '48'
                      ? const Icon(FontAwesomeIcons.moneyCheckDollar,
                          color: Colors.white)
                      : data.kontenId == '49'
                          ? const Icon(FontAwesomeIcons.moneyCheckDollar,
                              color: Colors.white)
                          : data.kontenId == '50'
                              ? const Icon(FontAwesomeIcons.moneyCheckDollar,
                                  color: Colors.white)
                              : const Icon(FontAwesomeIcons.moneyCheckDollar,
                                  color: Colors.white),
                  title: Text(
                    snapshot.data![index].kontenMenu.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: snapshot.data[index].kategoriNama == "Produk"
                      ? const Text('Produk')
                      : const Text('Menu'),
                  textColor: Colors.white,
                  onTap: () {
                    if (snapshot.data![index].kontenDeskripsi == null ||
                        snapshot.data![index].kontenDeskripsi == '' ||
                        snapshot.data![index].kontenDeskripsi == 'null') {
                      Get.snackbar(
                        'Perhatian',
                        'Belum ada konten',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    } else if (snapshot.data![index].kategoriNama == 'Produk') {
                      Get.toNamed(
                        Routes.DETAIL_PRODUCT_SYARIAH,
                        arguments: snapshot.data![index],
                      );
                    } else {
                      Get.toNamed(Routes.LAYER_THREE_SYARIAH,
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

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.data,
  }) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return Text(data.kontenId == '48'
        ? 'Tabungan Syariah'
        : data.kontenId == '49'
            ? 'Giro Syariah'
            : data.kontenId == '50'
                ? 'Deposito Syariah'
                : data.kontenId == '64'
                    ? 'Modal Kerja'
                    : data.kontenId == '65'
                        ? 'Investasi'
                        : data.kontenId == '73'
                            ? 'Kiriman Uang Syariah'
                            : 'Tabungan Syariah');
  }
}
