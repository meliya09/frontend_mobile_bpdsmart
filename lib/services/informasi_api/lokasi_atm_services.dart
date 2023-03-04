import 'package:bpdsmart_diy/models/Informasi/lokasi_atm.dart';
import 'package:bpdsmart_diy/models/Informasi/info.dart';
import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LokasiATMService {
  final httpClient = http.Client();
  final apiUrl = '${baseUrl}lokasiatm';

  Future<List<LokasiATM>> getLokasiATM() async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = lokasiATMFromJson(response.body);
      debugPrint(data.toString());
      return data;
    } else {
      throw Exception('Failed to load konvens');
    }
  }
}
