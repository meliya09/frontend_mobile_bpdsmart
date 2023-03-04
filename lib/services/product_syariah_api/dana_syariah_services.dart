import 'package:bpdsmart_diy/models/ProdukSyariah/syariah.dart';
import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DanaSyariahService {
  final httpClient = http.Client();
  final apiUrl = '${baseUrl}danasyariah';

  Future<List<Syariah>> getSyariahs() async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = syariahFromJson(response.body);
      debugPrint(data.toString());
      return data;
    } else {
      throw Exception('Failed to load konvens');
    }
  }
}
