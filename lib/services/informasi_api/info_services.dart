import 'package:bpdsmart_diy/models/Informasi/info.dart';
import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class InfoService {
  final httpClient = http.Client();
  final apiUrl = '${baseUrl}informasi';

  Future<List<Info>> getInfo() async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = infoFromJson(response.body);
      debugPrint(data.toString());
      return data;
    } else {
      throw Exception('Failed to load konvens');
    }
  }
}
