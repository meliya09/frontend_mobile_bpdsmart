import 'package:bpdsmart_diy/routes/routes.dart';
import 'package:bpdsmart_diy/services/informasi_api/jaringan_layanan_services.dart';
import 'package:bpdsmart_diy/services/informasi_api/lokasi_atm_services.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/layer_two_info_controller.dart';

class LayerTwoInfoView extends GetView<LayerTwoInfoController> {
  LayerTwoInfoView({Key? key}) : super(key: key);

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
                GetBuilder<LayerTwoInfoController>(
                  init: LayerTwoInfoController(),
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
      future: data.kontenId == '77'
          ? JaringanLayananService().getJaringanLayanan()
          : data.kontenId == '85'
              ? LokasiATMService().getLokasiATM()
              : JaringanLayananService().getJaringanLayanan(),
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
                  leading: data.kontenId == '77'
                      ? const Icon(FontAwesomeIcons.moneyCheckDollar,
                          color: Colors.white)
                      : data.kontenId == '85'
                          ? const Icon(FontAwesomeIcons.moneyCheckDollar,
                              color: Colors.white)
                          : const Icon(FontAwesomeIcons.moneyCheckDollar,
                              color: Colors.white),
                  title: Text(
                    snapshot.data![index].lokasiNama.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: snapshot.data[index].kategoriNama == "Lokasi"
                      ? const Text('Lokasi')
                      : const Text('Lokasi'),
                  textColor: Colors.white,
                  onTap: () {
                    if (snapshot.data![index].kategoriNama == 'Lokasi') {
                      Get.toNamed(
                        Routes.DETAIL_PRODUCT_INFO,
                        arguments: snapshot.data![index].kontenId,
                      );
                    }
                    // else {
                    //   Get.toNamed(Routes.LAYER_THREE_SYARIAH,
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
