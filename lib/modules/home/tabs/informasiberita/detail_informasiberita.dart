import 'package:bpdsmart_diy/modules/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformasiBeritaDetail extends GetView<HomeController> {
  String url =
      // 'https://static.episodate.com/images/tv-show/thumbnail/32157.jpg';
      'http://192.168.100.211:8080/home/1';
  @override
  Widget build(BuildContext contesxt) {
    return Scaffold(
        appBar: AppBar(title: Text("Avengers")),
        body: Image.network(
          url,
          width: double.infinity,
        ));
  }
}
