// import 'package:bpdsmart_diy/models/InfoBerita/InfoBerita.dart';
// import 'package:http/http.dart' as http;

// class InfoBeritaService {
//   static var client = http.Client();

//   static Future<dynamic> fetchBeritaData() async {
//     try {
//       var response = await client.get(
//         Uri.parse('http://192.168.43.146:8080/home'),
//       );
//       if (response.statusCode == 200) {
//         return beritaFromJson(response.body);
//       }
//       return null;
//     } catch (e) {
//       return null;
//     }
//   }
// }

import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../models/InfoBerita/InfoBerita.dart';

class InfoBeritaService {
  final httpClient = http.Client();
  final apiUrl = '${baseUrl}home';

  Future<List<InfoBerita>> getInfoBerita() async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = beritaFromJson(response.body);
      debugPrint(data.toString());
      return data;
    } else {
      throw Exception('Failed to load konvens');
    }
  }
}
