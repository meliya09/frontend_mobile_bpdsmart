import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controller/search_controller.dart';

class SearchDataViews extends StatefulWidget {
  const SearchDataViews({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SearchDataViewsState createState() => _SearchDataViewsState();
}

class _SearchDataViewsState extends State<SearchDataViews> {
  SearchController snapshot = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Searching'),
        ),
        body: Obx(() => snapshot.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: snapshot.searchList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      margin: const EdgeInsets.all(16),
                      child: ListTile(
                        leading: snapshot.searchList[index].kontenId == '7'
                            ? const Icon(FontAwesomeIcons.wallet,
                                color: Colors.white)
                            // : snapshot.searchList[index].kontenId == '8'
                            //     ? const Icon(FontAwesomeIcons.creditCard,
                            //         color: Colors.white)
                            //     : snapshot.searchList[index].kontenId == '9'
                            //         ? const Icon(FontAwesomeIcons.servicestack,
                            //             color: Colors.white)
                            : const Icon(FontAwesomeIcons.wallet,
                                color: Colors.white),
                        title: Text(
                            snapshot.searchList[index].kontenMenu.toString(),
                            style: const TextStyle(color: Colors.white)),
                        trailing:
                            snapshot.searchList[index].kategoriNama == 'Produk'
                                ? const Text('Produk')
                                : const Text('Menu'),
                        textColor: Colors.white,
                        onTap: () {
                          if (snapshot.searchList[index].kontenId == '7') {
                            Get.toNamed('/layer-one');
                          }
                          // if (snapshot.searchList[index].kontenId == '8') {
                          //   Get.toNamed('/layer-one');
                          // }
                          // if (snapshot.searchList[index].kontenId == '9') {
                          //   Get.toNamed('/layer-one');
                          // }
                          // if (snapshot.searchList[index].kategoriNama ==
                          //     'Menu') {
                          //   Get.toNamed('/layer-two');
                          // }
                          // if (snapshot.searchList[index].kontenId == '11') {
                          //   Get.toNamed('/layer-two');
                          // }
                          // if (snapshot.searchList[index].kontenId == '12') {
                          //   Get.toNamed('/layer-two');
                          // }
                          // if (snapshot.searchList[index].kontenId == '23') {
                          //   Get.toNamed('/layer-two');
                          // }
                          // if (snapshot.searchList[index].kontenId == '25') {
                          //   Get.toNamed('/layer-two');
                          // }
                          // if (snapshot.searchList[index].kontenId == '26') {
                          //   Get.toNamed('/layer-two');
                          // }
                          // if (snapshot.searchList[index].kontenId == '39') {
                          //   Get.toNamed('/layer-two');
                          // }
                          // if (snapshot.searchList[index].kontenId == '45') {
                          //   Get.toNamed('/layer-one-syariah');
                          // }
                          // Get.toNamed('/layer-one',
                          //     arguments: snapshot.searchList[index].kontenId);
                        },
                      ));
                })));
  }
}
