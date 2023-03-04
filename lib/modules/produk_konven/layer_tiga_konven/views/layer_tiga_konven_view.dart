import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/layer_tiga_konven_controller.dart';

class LayerTigaKonvenView extends GetView<LayerTigaKonvenController> {
  const LayerTigaKonvenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LayerThreeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LayerThreeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
