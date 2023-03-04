import 'package:bpdsmart_diy/models/Internal/bdy_kerja.dart';
import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class BdyKerjaService {
  final httpClient = http.Client();
  final apiUrl = '${baseUrl}bdykerja';

  Future<List<BdyKerja>> getBdyKerja() async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = bdyKerjaFromJson(response.body);
      debugPrint(data.toString());
      return data;
    } else {
      throw Exception('Failed to load konvens');
    }
  }
}