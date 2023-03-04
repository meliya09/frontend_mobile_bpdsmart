import 'package:bpdsmart_diy/models/Internal/internal.dart';
import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class StandarLayananService {
  final httpClient = http.Client();
  final apiUrl = '${baseUrl}standarlayanan';

  Future<List<Internal>> getInternals() async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = internalFromJson(response.body);
      debugPrint(data.toString());
      return data;
    } else {
      throw Exception('Failed to load konvens');
    }
  }
}
