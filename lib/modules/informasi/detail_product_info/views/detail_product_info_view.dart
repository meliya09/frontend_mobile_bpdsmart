import 'package:bpdsmart_diy/services/informasi_api/detail_lokasi_atm_services.dart';
import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:bpdsmart_diy/services/informasi_api/detail_lokasi_layanan_services.dart';
import 'package:bpdsmart_diy/services/informasi_api/lokasi_atm_services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../../app/routes/app_pages.dart';
import '../controllers/detail_product_info_controller.dart';

class DetailProductInfoView extends GetView<DetailProductInfoController> {
  DetailProductInfoView({Key? key}) : super(key: key);

  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data.lokasiNama),
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
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: data.lokasiGambar == null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              'https://via.placeholder.com/450x200.png',
                              width: 450,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              '${baseUrl}images/${data.lokasiGambar}',
                              width: 450,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    // color: melon,
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: TabBar(
                    isScrollable: true,
                    controller: controller.tabController,
                    // give the indicator a decoration (color and border radius)
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      color: Colors.blue[900],
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                        text: 'Peta Lokasi',
                        height: 100,
                      ),
                      Tab(
                        text: 'Daftar Lokasi',
                        height: 100,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 25.0,
                            ),
                            SizedBox(
                              width: 350,
                              height: 600,
                              // child: Text(
                              //   data.lokasiAlamat ?? '',
                              //   // style: text,
                              //   textAlign: TextAlign.left,
                              // ),
                              child: FlutterMap(
                                options: MapOptions(
                                  center: LatLng(
                                    double.parse(data.lokasiLat),
                                    double.parse(data.lokasiLon),
                                  ),
                                  zoom: 15.0,
                                ),
                                nonRotatedChildren: [
                                  AttributionWidget.defaultWidget(
                                    source: 'OpenStreetMap contributors',
                                    onSourceTapped: null,
                                  ),
                                ],
                                children: [
                                  TileLayerWidget(
                                    options: TileLayerOptions(
                                      urlTemplate:
                                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            GetBuilder<DetailProductInfoController>(
                              init: DetailProductInfoController(),
                              builder: (_) {
                                scrollDirection:
                                Axis.vertical;
                                return FutureBuilder(
                                  future: data == '1'
                                      ? DetailLokasiLayananService()
                                          .getDetailLokasiLayanan()
                                      : data == '162'
                                          ? DetailLokasiATMService()
                                              .getDetailLokasiAtm()
                                          // : data == '3'
                                          //     ? DetailLokasiLayananService()
                                          //         .getDetailLokasiLayanan()
                                          //     : data == '4'
                                          //         ? DetailLokasiLayananService()
                                          //             .getDetailLokasiLayanan()
                                          //         : data == '5'
                                          //             ? DetailLokasiLayananService()
                                          //                 .getDetailLokasiLayanan()
                                          //             : data == '6'
                                          //                 ? DetailLokasiLayananService()
                                          //                     .getDetailLokasiLayanan()
                                          //                 : data == '7'
                                          //                     ? DetailLokasiLayananService()
                                          //                         .getDetailLokasiLayanan()
                                          : DetailLokasiLayananService()
                                              .getDetailLokasiLayanan(),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          return Card(
                                            clipBehavior: Clip.antiAlias,
                                            color: Colors.white,
                                            margin: const EdgeInsets.all(8),
                                            child: ListTile(
                                              leading: data == '1'
                                                  ? const Icon(
                                                      FontAwesomeIcons
                                                          .mapLocation,
                                                      color: Colors.white)
                                                  : data == '162'
                                                      ? const Icon(
                                                          FontAwesomeIcons
                                                              .mapLocation,
                                                          color: Colors.white)
                                                      // : data == '3'
                                                      //     ? const Icon(
                                                      //         FontAwesomeIcons
                                                      //             .mapLocation,
                                                      //         color:
                                                      //             Colors.white)
                                                      //     : data == '4'
                                                      //         ? const Icon(
                                                      //             FontAwesomeIcons
                                                      //                 .mapLocation,
                                                      //             color: Colors
                                                      //                 .white)
                                                      //         : data == '5'
                                                      //             ? const Icon(
                                                      //                 FontAwesomeIcons
                                                      //                     .mapLocation,
                                                      //                 color: Colors
                                                      //                     .white)
                                                      //             : data == '6'
                                                      //                 ? const Icon(
                                                      //                     FontAwesomeIcons
                                                      //                         .mapLocation,
                                                      //                     color:
                                                      //                         Colors.white)
                                                      //                 : data == '7'
                                                      //                     ? const Icon(FontAwesomeIcons.mapLocation, color: Colors.white)
                                                      : const Icon(
                                                          FontAwesomeIcons
                                                              .mapLocation,
                                                          color: Colors.white),
                                              title: Text(
                                                snapshot.data![index].lokasiNama
                                                    .toString(),

                                                // style: heading1,
                                              ),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
