import 'package:bpdsmart_diy/models/ProdukKonven/konven.dart';
import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class JasaKonvenService {
  final httpClient = http.Client();
  final apiUrl = '${baseUrl}jasakonven';

  Future<List<Konven>> getJasaKonvens() async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = konvenFromJson(response.body);
      debugPrint(data.toString());
      return data;
    } else {
      throw Exception('Failed to load konvens');
    }
  }
}