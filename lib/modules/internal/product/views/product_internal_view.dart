import 'package:bpdsmart_diy/routes/routes.dart';
import 'package:bpdsmart_diy/services/internal_api/internal_services.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../controllers/product_internal_controller.dart';

class ProductInternalView extends GetView<ProductInternalController> {
  const ProductInternalView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Internal',
            // style: TextStyle(color: oldLavender),
          ),
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.home, color: Colors.white, size: 30),
              onPressed: () {
                Get.toNamed(Routes.HOME);
              },
            ),
          ],
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<ProductInternalController>(
                init: ProductInternalController(),
                builder: (_) {
                  return FutureBuilder(
                    future: InternalService().getInternals(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              // color: melon,
                              margin: const EdgeInsets.all(16),
                              child: ListTile(
                                leading: snapshot.data![index].kontenId == '93'
                                    ? const Icon(FontAwesomeIcons.userGroup,
                                        color: Colors.white)
                                    : snapshot.data![index].kontenId == '94'
                                        ? const Icon(FontAwesomeIcons.userGroup,
                                            color: Colors.white)
                                        : snapshot.data![index].kontenId == '95'
                                            ? const Icon(
                                                FontAwesomeIcons.userGroup,
                                                color: Colors.white)
                                            : snapshot.data![index].kontenId ==
                                                    '96'
                                                ? const Icon(
                                                    FontAwesomeIcons.userGroup,
                                                    color: Colors.white)
                                                : const Icon(
                                                    FontAwesomeIcons.userGroup,
                                                    color: Colors.white),
                                title: Text(
                                    snapshot.data![index].kontenMenu.toString(),
                                    style: TextStyle(color: Colors.white)),
                                trailing:
                                    snapshot.data![index].kategoriNama == 'News'
                                        ? const Text('News')
                                        : snapshot.data![index].kategoriNama ==
                                                'Info'
                                            ? const Text('Info')
                                            : const Text('Menu'),
                                textColor: Colors.white,
                                onTap: () {
                                  if (snapshot.data![index].kategoriNama ==
                                      'News') {
                                    Get.toNamed(
                                      Routes.DETAIL_PRODUCT_INTERNAL,
                                      arguments: snapshot.data![index].kontenId,
                                    );
                                  } else {
                                    Get.toNamed(Routes.LAYER_ONE_INTERNAL,
                                        arguments:
                                            snapshot.data![index].kontenId);
                                  }
                                  // Get.toNamed(Routes.LAYER_ONE_INTERNAL,
                                  //     arguments:
                                  //         snapshot.data![index].kontenId);
                                },
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ));
  }
}
