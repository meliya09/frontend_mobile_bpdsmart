import 'dart:async';

import 'package:bpdsmart_diy/models/models.dart';
import 'package:bpdsmart_diy/shared/utils/utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  EasyLoading.dismiss();

  if (response.statusCode != 200) {
    handleErrorStatus(response);
    return;
  }

  return response;
}

// ignore: always_specify_types
void handleErrorStatus(Response response) {
  switch (response.statusCode) {
    case 400:
      final ErrorResponse message = ErrorResponse.fromJson(response.body);
      CommonWidget.toast(message.error);
      break;
    default:
  }

  return;
}
