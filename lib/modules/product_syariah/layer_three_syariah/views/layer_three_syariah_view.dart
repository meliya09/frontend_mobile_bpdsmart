import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/layer_three_syariah_controller.dart';

class LayerThreeSyariahView extends GetView<LayerThreeSyariahController> {
  const LayerThreeSyariahView({Key? key}) : super(key: key);
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
