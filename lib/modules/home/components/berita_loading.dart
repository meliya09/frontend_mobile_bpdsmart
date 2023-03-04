// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';

// class BeritaLoading extends StatelessWidget {
//   const BeritaLoading({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       highlightColor: Colors.white,
//       baseColor: Colors.grey[300]!,
//       child: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
//             decoration: BoxDecoration(
//                 color: Colors.grey,
//                 borderRadius: BorderRadius.all(Radius.circular(10))),
//             child: ClipRRect(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               child: AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: Container(
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 8,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 8,
//                 width: 8,
//                 decoration:
//                     BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
//               ),
//               SizedBox(
//                 width: 3,
//               ),
//               Container(
//                 height: 8,
//                 width: 8,
//                 decoration:
//                     BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
//               ),
//               SizedBox(
//                 width: 3,
//               ),
//               Container(
//                 height: 8,
//                 width: 8,
//                 decoration:
//                     BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
//               ),
//               SizedBox(
//                 width: 3,
//               ),
//               Container(
//                 height: 8,
//                 width: 8,
//                 decoration:
//                     BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
//               ),
//               SizedBox(
//                 width: 3,
//               ),
//               Container(
//                 height: 8,
//                 width: 8,
//                 decoration:
//                     BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
//               ),
//               SizedBox(
//                 width: 3,
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BeritaLoading extends StatelessWidget {
  const BeritaLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey.shade300,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
              ),
              const SizedBox(
                width: 3,
              ),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
              ),
              const SizedBox(
                width: 3,
              ),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
              ),
              const SizedBox(
                width: 3,
              ),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
              ),
              const SizedBox(
                width: 3,
              ),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
