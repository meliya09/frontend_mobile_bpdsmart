import 'package:bpdsmart_diy/routes/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controllers/product_simulasi_controller.dart';

class ProductSimulasiView extends GetView<ProductSimulasiController> {
  const ProductSimulasiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Simulasi',
          // style: TextStyle(color: oldLavender),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.wallet, color: Colors.white),
              title: const Text('Dana'),
              textColor: Colors.white,
              onTap: () {
                Get.toNamed(Routes.SIMULASI_DANA);
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.all(15),
            child: ListTile(
              leading:
                  const Icon(FontAwesomeIcons.creditCard, color: Colors.white),
              title: const Text('Kredit'),
              textColor: Colors.white,
              onTap: () {
                Get.toNamed(Routes.SIMULASI_KREDIT);
              },
            ),
          ),
        ],
      ),
    );
  }
}
