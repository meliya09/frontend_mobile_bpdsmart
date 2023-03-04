import 'dart:core';
import 'dart:io';

import 'package:bpdsmart_diy/modules/product_syariah/detail_product_syariah/views/pdfexport/pdfpreview.dart';
import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../../../app/routes/app_pages.dart';
import '../controllers/detail_product_syariah_controller.dart';

class DetailProductSyariahView extends GetView<DetailProductSyariahController> {
  DetailProductSyariahView({Key? key}) : super(key: key);

  // ignore: always_specify_types
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data.kontenJudul),
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
        floatingActionButton: FloatingActionButton(
          // onPressed: _displayPdf,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PdfPreviewScreen(),
              ),
            );
            // rootBundle.
          },
          // onPressed: () => controller.getPDF(),

          child: Icon(Icons.picture_as_pdf),
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
                CarouselSlider(
                    options: CarouselOptions(
                      height: 200,

                      // autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: data.kontenGambar == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  'https://via.placeholder.com/450x200.png',
                                  width: 450,
                                  height: 200,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  '${baseUrl}images/${data.kontenGambar}',
                                  width: 450,
                                  height: 200,
                                  fit: BoxFit.fill,
                                ),
                              ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: data.kontenGambar == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  'https://via.placeholder.com/450x200.png',
                                  width: 450,
                                  height: 200,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Stack(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {},
                                      child: Image.network(
                                        '${baseUrl}images/${data.kontenGambar2}',
                                        width: 450,
                                        height: 200,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: IconButton(
                                            iconSize: 30,
                                            color: Colors.blue,
                                            alignment: Alignment.bottomRight,
                                            onPressed: () async {
                                              showCupertinoDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return CupertinoAlertDialog(
                                                      title: Text(
                                                          'Download Gambar'),
                                                      content: Text(
                                                          'Apakah anda yakin ingin mengunduh gambar ini?'),
                                                      actions: [
                                                        CupertinoDialogAction(
                                                          child: Text('Tidak'),
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                        ),
                                                        CupertinoDialogAction(
                                                          child: Text('Ya'),
                                                          onPressed: () async {
                                                            final response =
                                                                await http.get(
                                                                    Uri.parse(
                                                                        '${baseUrl}images/${data.kontenGambar2}'));
                                                            final documentDirectory =
                                                                await getApplicationDocumentsDirectory();
                                                            final file = File(path.join(
                                                                documentDirectory
                                                                    .path,
                                                                '${data.kontenGambar2}'));
                                                            file.writeAsBytesSync(
                                                                response
                                                                    .bodyBytes);
                                                            final result =
                                                                await ImageGallerySaver
                                                                    .saveFile(file
                                                                        .path);
                                                            print(result);
                                                            Get.snackbar(
                                                              "Berhasil",
                                                              "mengunduh gambar",
                                                              snackPosition:
                                                                  SnackPosition
                                                                      .BOTTOM,
                                                              backgroundColor:
                                                                  Colors.blue,
                                                            );

                                                            // Get.back();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            icon: Icon(Icons.download),
                                          )),
                                    )
                                  ],
                                )),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: data.kontenGambar == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  'https://via.placeholder.com/450x200.png',
                                  width: 450,
                                  height: 200,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  '${baseUrl}images/${data.kontenGambar3}',
                                  width: 450,
                                  height: 200,
                                  fit: BoxFit.fill,
                                ),
                              ),
                      ),
                    ]),
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
                        text: 'Deskripsi',
                        height: 100,
                      ),
                      Tab(
                        text: 'Syarat',
                      ),
                      Tab(
                        text: 'Ketentuan',
                      ),
                      Tab(
                        text: 'Fasilitas',
                      ),
                      Tab(
                        text: 'SK',
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
                              height: 20.0,
                            ),
                            SizedBox(
                              width: 350,
                              child: Html(
                                data: data.kontenDeskripsi,
                                style: {
                                  'body': Style(
                                    fontSize: FontSize(13.0),
                                  ),
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              width: 350,
                              child: Html(
                                data: data.kontenSyarat ?? '',
                                style: {
                                  'body': Style(
                                    fontSize: FontSize(13.0),
                                  ),
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              width: 350,
                              child: Html(
                                data: data.kontenKetentuan ?? '',
                                style: {
                                  'body': Style(
                                    fontSize: FontSize(13.0),
                                  ),
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              width: 350,
                              child: Html(
                                data: data.kontenFasilitas ?? '',
                                style: {
                                  'body': Style(
                                    fontSize: FontSize(13.0),
                                  ),
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              width: 350,
                              child: Html(
                                data: data.kontenSk ?? '',
                                style: {
                                  'body': Style(
                                    fontSize: FontSize(13.0),
                                  ),
                                },
                              ),
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
