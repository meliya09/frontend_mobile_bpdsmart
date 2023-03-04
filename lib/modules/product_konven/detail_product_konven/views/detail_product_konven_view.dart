// ignore_for_file: always_specify_types

import 'package:bpdsmart_diy/app/routes/app_pages.dart';
import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:get/get.dart';

import '../controllers/detail_product_konven_controller.dart';

class DetailProductKonvenView extends GetView<DetailProductKonvenController> {
  DetailProductKonvenView({Key? key}) : super(key: key);

  // ignore: always_specify_types
  final data = Get.arguments;
  // final _htmlContent = Get.arguments;

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
                                data: data.kontenDeskripsi ?? '',
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
                        child: Html(data: data.kontenKetentuan ?? '',

                            //ignore: prefer_single_quotes
//                           data: """
//                                                <h1>Table support:</h1>
//                           <table>
//                           <colgroup>
//                           <col width="50%" />
//                           <col span="2" width="25%" />
//                           </colgroup>
//                           <tbody>
//   <tr>
//    <td >Jangka waktu :</td>
//   </tr>
//   <tr>
//    <td >PNS, Pegawai BUMN/BUMD, TNI/POLRI</td>
//    <td>maks 240 bulan</td>
//    <td>Gaji melalui Bank BPD DIY</td>
//   </tr>
//   <tr>
//    <td >PNS, Pegawai BUMN/BUMD, TNI/POLRI</td>
//    <td>maks 180 bulan</td>
//    <td>Gaji tidak melalui Bank BPD DIY</td>
//   </tr>
//   <tr>
//    <td >CPNS</td>
//    <td>maks 120 bulan</td>

//   </tr>
//   <tr>
//    <td >DPRD DIY/Kota/Kabupaten</td>
//    <td >maks 60 bulan</td>
//    <td>Gaji melalui Bank BPD DIY</td>
//   </tr>
//   <tr>
//    <td >Kepala Desa/Perangkat Desa</td>
//    <td>maks 180 bulan</td>
//    <td>Gaji melalui Bank BPD DIY</td>
//   </tr>
//   <tr>
//    <td>Instansi Swasta</td>
//    <td>maks 120 bulan</td>
//    <td>Gaji melalui Bank BPD DIY</td>
//   </tr>
//   <tr>
//    <td>&nbsp;</td>
//    <td>maks 60 bulan</td>
//    <td>Gaji tidak melalui Bank BPD DIY</td>
//   </tr>
//   <tr>
//    <td>Ketentuan lain</td>
//    <td>1 bulan sebelum usia pensiun kredit harus lunas.</td>
//    <td>&nbsp;</td>
//   </tr>
//   <tr>
//    <td>Plafon :</td>
//    <td>&nbsp;</td>
//    <td>&nbsp;</td>
//   </tr>
//   <tr>
//    <td >PNS, CPNS, Pegawai BUMN/BUMD, TNI/POLRI, DPRD DIY/Kota/Kabupaten, Perangkat Desa&nbsp;</td>
//    <td>maks 90% dari gaji bersih</td>
//    <td>&nbsp;</td>
//   </tr>
//   <tr>
//    <td >Pegawai Swasta</td>
//    <td>maks 90% dari gaji bersih</td>
//    <td>Gaji melalui Bank BPD DIY</td>
//   </tr>
//   <tr>
//    <td>&nbsp;</td>
//    <td>maks 75% dari gaji bersih</td>
//    <td>Gaji tidak melalui Bank BPD DIY</td>
//   </tr>
//   <tr>
//    <td >Suku bunga</td>
//    <td >9,5% efektif/tahun</td>
//    <td>Dikecualikan bagi Pegawai Tidak Tetap (PTT)/Tenaga Honorer Pemerintah Daerah yang gajinya melalui Bank BPD DIY dikenakan 1% diatas bunga Swaguna yang berlaku</td>
//   </tr>
//   <tr>
//    <td >&nbsp;</td>
//    <td>&nbsp;</td>
//    <td>&nbsp;</td>
//   </tr>
//   <tr>
//    <td >Provisi</td>
//    <td >s.d Rp 200.000.000;</td>
//    <td>1% dari plafon, minimal Rp 100.000;</td>
//   </tr>
//   <tr>
//    <td >&nbsp;</td>
//    <td >di atas Rp 200.000.000;</td>
//    <td>0,5% dari plafon</td>
//   </tr>
//   <tr>
//    <td >&nbsp;</td>
//    <td >untuk <em>take over</em></td>
//    <td>0% (bebas provisi)</td>
//   </tr>
//   <tr>
//    <td >Asuransi</td>
//    <td colspan="2" style="width:413px">wajib asuransi jiwa dan PHK, biaya dibebankan ke nasabah</td>
//   </tr>
//   <tr>
//    <td>Administrasi&nbsp;</td>
//    <td >-</td>
//    <td>&nbsp;</td>
//   </tr>
//   <tr>
//    <td >Denda keterlambatan</td>
//    <td >minimal 50% dari tingkat bunga/tahun</td>
//    <td >&nbsp;</td>
//   </tr>
//   <tr>
//    <td >Denda pelunasan dipercepat</td>
//    <td>5% dari plafon akhir kredit pada saat pelunasan</td>
//    <td>&nbsp;</td>
//   </tr>
//   <tr>
//    <td >Jaminan</td>
//    <td>Gaji</td>
//    <td>&nbsp;</td>
//   </tr>
//  </tbody>
//                           </table>
//                                                 """,
                            // ignore: always_specify_types
                            customRenders: {
                              tableMatcher(): tableRender(),
                            }

                            // style: {
                            //   // add style to the tags in HTML code
                            //   "table": Style(
                            //     backgroundColor:
                            //         Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                            //   ),
                            //   "tr": Style(
                            //     // border: Border(
                            //     //     bottom: BorderSide(color: Colors.grey)),
                            //     border: Border.all(color: Colors.black),
                            //   ),
                            //   "th": Style(
                            //     // padding: EdgeInsets.all(6),
                            //     backgroundColor: Colors.grey,
                            //   ),
                            //   "td": Style(
                            //     // padding: EdgeInsets.all(6),
                            //     alignment: Alignment.topLeft,
                            //   ),
                            //   'h5': Style(
                            //       maxLines: 2,
                            //       textOverflow: TextOverflow.ellipsis),
                            // },
                            // style: {
                            //   "table": Style(
                            //     backgroundColor:
                            //         Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                            //   ),
                            //   // some other granular customizations are also possible
                            //   "tr": Style(
                            //       // border: Border(
                            //       //     bottom: BorderSide(color: Colors.grey)),
                            //       ),
                            //   "th": Style(
                            //       // padding: EdgeInsets.all(6),
                            //       // backgroundColor: Colors.grey,
                            //       ),
                            //   "td": Style(
                            //       // padding: EdgeInsets.all(6),
                            //       // alignment: Alignment.topLeft,
                            //       ),
                            //   // text that renders h1 elements will be red
                            //   "h1": Style(color: Colors.red),
                            // },
                            // style: {
                            //   // tables will have the below background color
                            //   "table": Style(
                            //     backgroundColor:
                            //         Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                            //   ),
                            //   // some other granular customizations are also possible
                            //   "tr": Style(
                            //     border: Border(
                            //         bottom: BorderSide(
                            //             color: Colors.grey, ),
                            //         left: BorderSide(color: Colors.grey)),
                            //   ),
                            //   "th": Style(
                            //     padding: EdgeInsets.all(6),
                            //     backgroundColor: Colors.grey,
                            //   ),
                            //   "td": Style(
                            //     padding: EdgeInsets.all(2),
                            //     alignment: Alignment.topLeft,
                            //   ),
                            //   // text that renders h1 elements will be red
                            //   "h1": Style(color: Colors.red),
                            //   'col width="50%"': Style(),
                            //   'col span="2" width="25%"': Style(),
                            //   'td colspan="2"': Style(),
                            //   'td rowspan="2"': Style(),
                            // }
                            ),
                      ),

                      // ignore: always_specify_types

                      // // ignore: always_specify_types

                      // add style to the tags in HTML code

                      // child: Column(
                      // children: [
                      //   const SizedBox(
                      //     height: 25.0,
                      //   ),

                      //  _htmlContent.kontenKetentuan ?? '',

                      // Text(
                      //   data.kontenKetentuan ?? '',
                      // ),
                      // SizedBox(
                      //   width: 350,
                      //   child: Text(
                      //     _htmlContent.kontenKetentuan ?? '',
                      //     // style: text,
                      //     textAlign: TextAlign.left,
                      //   ),
                      // ),
                      //   ],
                      // ),
                      // ),
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
                                shrinkWrap: true,
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
