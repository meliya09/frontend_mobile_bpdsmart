import 'package:bpdsmart_diy/models/ProdukSyariah/tab_syariah.dart';
import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class TabunganSyariahService {
  final httpClient = http.Client();
  final apiUrl = '${baseUrl}tabsyariah';

  Future<List<TabSyariah>> getTabunganSyariah() async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = tabSyariahFromJson(response.body);
      debugPrint(data.toString());
      return data;
    } else {
      throw Exception('Failed to load konvens');
    }
  }
}
