import 'package:bpdsmart_diy/routes/routes.dart';
import 'package:bpdsmart_diy/services/internal_api/berita_terkini_services.dart';
import 'package:bpdsmart_diy/services/internal_api/info_manajemen_services.dart';
import 'package:bpdsmart_diy/services/internal_api/std_layanan_services.dart';
import 'package:bpdsmart_diy/services/internal_api/bdy_kerja_services.dart';
import 'package:bpdsmart_diy/services/internal_api/identitas_pribadi_services.dart';
import 'package:bpdsmart_diy/services/internal_api/standar_layanan_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/layer_two_internal_controller.dart';

class LayerTwoInternalView extends GetView<LayerTwoInternalController> {
  LayerTwoInternalView({Key? key}) : super(key: key);

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
                GetBuilder<LayerTwoInternalController>(
                  init: LayerTwoInternalController(),
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
      future:
          // data.kontenId == '93'
          //     ? BeritaTerkiniService().getInternals()
          //     : data.kontenId == '94'
          //         ? InfoManajemenService().getInternals()
          data.kontenId == '98'
              ? IdentitasService().getInternals()
              : data.kontenId == '100'
                  ? StandarLayananService().getInternals()
                  : IdentitasService().getInternals(),
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
                  leading:
                      // data.kontenId == '93'
                      //     ? const Icon(FontAwesomeIcons.newspaper,
                      //         color: Colors.white)
                      //     : data.kontenId == '94'
                      //         ? const Icon(FontAwesomeIcons.newspaper,
                      //             color: Colors.white)
                      data.kontenId == '98'
                          ? const Icon(FontAwesomeIcons.userGroup,
                              color: Colors.white)
                          : data.kontenId == '100'
                              ? const Icon(FontAwesomeIcons.userGroup,
                                  color: Colors.white)
                              // : data.kontenId == '98'
                              //     ? const Icon(FontAwesomeIcons.servicestack,
                              //         color: Colors.white)
                              : const Icon(FontAwesomeIcons.wallet,
                                  color: Colors.white),
                  title: Text(
                    snapshot.data![index].kontenMenu.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: snapshot.data[index].kategoriNama == "News"
                      ? const Text('News')
                      : snapshot.data![index].kategoriNama == 'Info'
                          ? const Text('Info')
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
                    } else if (snapshot.data![index].kategoriNama == 'News') {
                      Get.toNamed(
                        Routes.DETAIL_PRODUCT_INTERNAL,
                        arguments: snapshot.data![index],
                      );
                    } else if (snapshot.data![index].kategoriNama == 'Info') {
                      Get.toNamed(
                        Routes.DETAIL_PRODUCT2_INTERNAL,
                        arguments: snapshot.data![index],
                      );
                    } else {
                      Get.toNamed(Routes.LAYER_THREE_INTERNAL,
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
    return Text(data.kontenId == '98'
        ? 'Identitas Pribadi'
        : data.kontenId == '100'
            ? 'Standar Layanan'
            : 'Identitas Pribadi');
  }
}
