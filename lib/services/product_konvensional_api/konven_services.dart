import 'package:bpdsmart_diy/models/ProdukKonven/konven.dart';
import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class KonvenService {
  final http.Client httpClient = http.Client();
  final String apiUrl = '${baseUrl}konven';

  Future<List<Konven>> getKonvens() async {
    final http.Response response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<Konven> data = konvenFromJson(response.body.toString());
      debugPrint(data.toString());
      return data;
    } else {
      throw Exception('Failed to load konvens');
    }
  }
}
