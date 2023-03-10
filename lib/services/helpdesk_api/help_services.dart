import 'package:bpdsmart_diy/models/HelpdeskModel.dart';
import 'package:bpdsmart_diy/shared/constants/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HelpService {
  final httpClient = http.Client();
  final apiUrl = '${baseUrl}datausers';

  Future<List<HelpdeskModel>> getHelp() async {
    final response = await httpClient.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = helpdeskModelFromJson(response.body);
      debugPrint(data.toString());
      return data;
    } else {
      throw Exception('Failed to load konvens');
    }
  }
}
