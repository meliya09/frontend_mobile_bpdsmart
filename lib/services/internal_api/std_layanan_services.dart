import 'package:bpdsmart_diy/models/Internal/std_layanan.dart';
import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class StdLayananService {
  final httpClient = http.Client();
  final apiUrl = '${baseUrl}stdlayanan';

  Future<List<StdLayanan>> getStdLayanan() async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = stdLayananFromJson(response.body);
      debugPrint(data.toString());
      return data;
    } else {
      throw Exception('Failed to load konvens');
    }
  }
}
