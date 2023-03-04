import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/routes/app_pages.dart';
import '../controllers/detail_product2_controller.dart';

class DetailProduct2InternalView
    extends GetView<DetailProduct2InternalController> {
  DetailProduct2InternalView({Key? key}) : super(key: key);

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
                                child: Image.network(
                                  '${baseUrl}images/${data.kontenGambar2}',
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
                  // child: const Center(
                  //   child: Text(
                  //     'DESKRIPSI',
                  //     style: TextStyle(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.bold,
                  //       fontFamily: 'RobotoMono',
                  //       color: Color.fromARGB(255, 22, 7, 233),
                  //     ),
                  //   ),
                  // ),

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
                              child: Text(
                                data.kontenDeskripsi,
                                // style: text,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //   child: SingleChildScrollView(
                  //     child: Column(
                  //       children: [
                  //         const SizedBox(
                  //           height: 25,
                  //         ),
                  //         Text(
                  //           data.kontenDeskripsi,
                  //           style: const TextStyle(
                  //             fontSize: 15,
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           height: 25,
                  //         ),

                  //       ],
                  //     ),
                  //   ),
                ),
              ],
            ),
          ),
        ));
  }
}
