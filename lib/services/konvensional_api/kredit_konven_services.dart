import 'package:bpdsmart_diy/models/Konvensional/konven_model.dart';
import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class KreditKonvenService {
  final httpClient = http.Client();
  final apiUrl = '${baseUrl}kredit';

  Future<List<KonvenModel>> getKreditKonvens() async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = konvenModelFromJson(response.body);
      debugPrint(data.toString());
      return data;
    } else {
      throw Exception('Failed to load konvens');
    }
  }
}
