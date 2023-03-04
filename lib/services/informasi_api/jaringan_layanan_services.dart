import 'package:bpdsmart_diy/models/Informasi/info.dart';
import 'package:bpdsmart_diy/models/Informasi/jaringan_layanan.dart';
import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class JaringanLayananService {
  final httpClient = http.Client();
  final apiUrl = '${baseUrl}jaringanpelayanan';

  Future<List<JaringanLayanan>> getJaringanLayanan() async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = jaringanLayananFromJson(response.body);
      debugPrint(data.toString());
      return data;
    } else {
      throw Exception('Failed to load konvens');
    }
  }
}
