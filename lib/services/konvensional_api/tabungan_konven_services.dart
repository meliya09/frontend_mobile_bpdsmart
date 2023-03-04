import 'package:bpdsmart_diy/models/Konvensional/tabkonven_model.dart';
import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class TabunganKonvenService {
  final httpClient = http.Client();
  final apiUrl = '${baseUrl}tabkonven';

  Future<List<TabkonvenModel>> getTabunganKonven() async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = tabkonvenModelFromJson(response.body);
      debugPrint(data.toString());
      return data;
    } else {
      throw Exception('Failed to load konvens');
    }
  }
}
