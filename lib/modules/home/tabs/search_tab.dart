import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/widgets/color_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bpdsmart_diy/routes/app_pages.dart';
import '../../search_menu/views/search_data_views.dart';

class SearchViews extends StatefulWidget {
  String category;
  // ignore: sort_constructors_first
  SearchViews({super.key, required this.category});

  @override
  // ignore: library_private_types_in_public_api
  _SearchViewsState createState() => _SearchViewsState();
}

class _SearchViewsState extends State<SearchViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: SingleChildScrollView(
            child: Container(
                child: Column(
          // ignore: always_specify_types
          children: [
            Image.asset(
              'assets/search.png',
              fit: BoxFit.fill,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
              child: TextField(
                  decoration: const InputDecoration(
                      hintText: 'Cari Menu', border: InputBorder.none),
                  onChanged: (String newValue) {
                    setState(() {
                      widget.category = newValue;
                    });
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(const SearchDataViews(), arguments: widget.category);
                },
                child: const Icon(Icons.search))
          ],
        ))));
  }
}
