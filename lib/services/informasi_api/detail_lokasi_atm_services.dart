import 'dart:convert';

import 'package:bpdsmart_diy/models/Informasi/detail_lokasiatm.dart';
import 'package:bpdsmart_diy/models/Informasi/info.dart';
import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

// final httpClient = http.Client();

class DetailLokasiATMService {
  // Future<DetailLokasiLayanan> getDetailLokasiLayanan(String id) async {
  //   final apiUrl = '${baseUrl}detaillokasilayanan/$id';
  //   final response = await httpClient.get(
  //     Uri.parse(apiUrl),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //     },
  //   );
  //   debugPrint('response: ${response.body}');
  //   if (response.statusCode == 200) {
  //     return DetailLokasiLayanan.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load post');
  //   }
  // }

  final httpClient = http.Client();
  final apiUrl = '${baseUrl}detaillokasiatm';

  Future<List<DetailLokasiATM>> getDetailLokasiAtm() async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = detailLokasiATMFromJson(response.body);
      debugPrint(data.toString());
      return data;
    } else {
      throw Exception('Failed to load konvens');
    }
  }
}
