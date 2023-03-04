import 'package:bpdsmart_diy/models/Internal/internal.dart';
import 'package:bpdsmart_diy/models/Internal/berita_terkini.dart';
import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class BeritaTerkiniService {
  final httpClient = http.Client();
  final apiUrl = '${baseUrl}detailinternal/93';

  Future<List<BeritaTerkini>> getBeritaTerkini() async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = beritaTerkiniFromJson(response.body);
      debugPrint(data.toString());
      return data;
    } else {
      throw Exception('Failed to load konvens');
    }
  }
}
