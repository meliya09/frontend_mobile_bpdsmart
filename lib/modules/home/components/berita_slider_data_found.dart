// import 'package:bpdsmart_diy/models/InfoBerita/InfoBerita.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:bpdsmart_diy/models/InfoBerita/InfoBerita.dart';

// class BeritaSliderDataFound extends StatefulWidget {
//   final List<InfoBerita> beritalList;
//   const BeritaSliderDataFound(this.beritalList);

//   @override
//   _BeritaSliderDataFoundState createState() => _BeritaSliderDataFoundState();
// }

// class _BeritaSliderDataFoundState extends State<BeritaSliderDataFound> {
//   int _current = 0;
//   late List<Widget> imageSlider;

//   @override
//   void initState() {
//     imageSlider = widget.beritalList
//         .map((e) => Container(
//               margin: EdgeInsets.all(10),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                 child: Stack(
//                   children: [
//                     CachedNetworkImage(
//                       imageUrl: e.kontenGambar,
//                       errorWidget: (context, url, error) => Icon(Icons.error),
//                       progressIndicatorBuilder:
//                           (context, url, downloadProgress) => Center(
//                         child: CircularProgressIndicator(
//                           value: downloadProgress.progress,
//                         ),
//                       ),
//                       fit: BoxFit.cover,
//                       width: 1000,
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: Container(
//                         padding: EdgeInsets.all(10),
//                         child: Text(
//                           'Some Text',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ))
//         .toList();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           CarouselSlider(
//               items: imageSlider,
//               options: CarouselOptions(
//                   autoPlay: true,
//                   enlargeCenterPage: true,
//                   aspectRatio: 16 / 9,
//                   viewportFraction: 1,
//                   onPageChanged: (index, reason) {
//                     setState(() {
//                       _current = index;
//                     });
//                   })),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: widget.beritalList.map((e) {
//               int index = widget.beritalList.indexOf(e);
//               return Container(
//                 width: 8,
//                 height: 8,
//                 margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: _current == index
//                       ? Color.fromRGBO(0, 0, 0, 0.9)
//                       : Color.fromRGBO(0, 0, 0, 0.4),
//                 ),
//               );
//             }).toList(),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:bpdsmart_diy/models/InfoBerita/InfoBerita.dart';
import 'package:bpdsmart_diy/services/infoberita/infoberita_api.dart';
import 'package:bpdsmart_diy/routes/routes.dart';

import 'package:bpdsmart_diy/shared/constants/common.dart';

class BeritaSliderDataFound extends StatefulWidget {
  const BeritaSliderDataFound({Key? key, required this.data}) : super(key: key);
  final List<InfoBerita> data;
  @override
  State<StatefulWidget> createState() {
    return _BeritaSliderDataFoundState();
  }
}

class _BeritaSliderDataFoundState extends State<BeritaSliderDataFound> {
  int _current = 0;
  late List<Widget> imageSliders;
  @override
  void initState() {
    imageSliders = widget.data
        .map((InfoBerita item) => Container(
              margin: const EdgeInsets.all(10),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.DETAIL_PRODUCT_BERITA,
                              arguments: item);
                        },
                        child: Image.network(
                          '${baseUrl}images/${item.kontenGambar}',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            onPageChanged: (int index, CarouselPageChangedReason reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.data.map((InfoBerita url) {
          final int index = widget.data.indexOf(url);
          return Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == index
                  ? const Color.fromRGBO(0, 0, 0, 0.9)
                  : const Color.fromRGBO(0, 0, 0, 0.4),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
