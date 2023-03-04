import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../app/routes/app_pages.dart';
import '../controllers/simulasi_kredit_controller.dart';

class SimulasiKreditView extends GetView<SimulasiKreditController> {
  SimulasiKreditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Simulasi Kredit'),
          actions: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white, size: 30),
              onPressed: () {
                Get.toNamed(Routes.HOME);
              },
            ),
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: FormBuilder(
              key: controller.formKey,
              autoFocusOnValidationFailure: true,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Simulasi Kredit',
                    style: TextStyle(
                      color: Color.fromARGB(255, 139, 171, 185),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'year',
                          validator: FormBuilderValidators.required(),
                          controller: controller.jangkaWaktu,
                          decoration: const InputDecoration(
                            labelText: 'Jangka Waktu',
                            // border: OutlineInputBorder(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            prefixIcon: Icon(Icons.calendar_today),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: FormBuilderTextField(
                          name: 'bunga',
                          textAlign: TextAlign.right,
                          validator: FormBuilderValidators.required(),
                          controller: controller.sukuBunga,
                          decoration: const InputDecoration(
                              labelText: 'Suku Bunga',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              suffixText: '%'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormBuilderTextField(
                        name: 'jumlahPinjam',
                        validator: FormBuilderValidators.required(),
                        controller: controller.jumlahPinjam,
                        decoration: const InputDecoration(
                          labelText: 'Jumlah Pinjaman',
                          prefixText: 'Rp. ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GFButton(
                        onPressed: () {
                          if (controller.formKey.currentState
                                  ?.saveAndValidate() ??
                              false) {
                            controller.result();
                          } else {
                            Get.snackbar(
                              'Error',
                              'Please fill all the fields',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          }
                        },
                        text: 'Hitung',
                        color: Colors.blue,
                        fullWidthButton: true,
                        size: GFSize.LARGE,
                        borderShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Hasil Simulasi',
                    style: TextStyle(
                      color: Color.fromARGB(255, 139, 171, 185),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 400,
                    child: DataTable2(
                      headingRowColor: MaterialStateColor.resolveWith(
                          (Set<MaterialState> states) =>
                              Color.fromARGB(255, 5, 73, 129)),
                      columnSpacing: 8,
                      horizontalMargin: 8,
                      minWidth: 200,
                      // dividerThickness: 1,
                      // sortAscending: true,
                      border: TableBorder.all(color: Colors.black),
                      // bottomMargin: 5,
                      sortColumnIndex: 0,
                      columns: const [
                        // DataColumn2(
                        //     label: Text('Angsuran Bunga'), size: ColumnSize.S),
                        // DataColumn2(
                        //     label: Text('Angsuran Pokok'), size: ColumnSize.S),
                        DataColumn2(
                            label: Text('Jumlah Angsuran'), size: ColumnSize.S),
                      ],
                      rows: [
                        DataRow2(
                          cells: [
                            // DataCell(
                            //   FormBuilderTextField(
                            //     name: 'jangkaWaktu',
                            //     readOnly: true,
                            //     controller: controller.jangkaWaktu,
                            //     keyboardType: TextInputType.number,
                            //     decoration: const InputDecoration(),
                            //   ),
                            // ),
                            // DataCell(
                            //   FormBuilderTextField(
                            //     textAlign: TextAlign.right,
                            //     name: 'angsuranBunga',
                            //     readOnly: true,
                            //     controller: controller.angsuranBunga,
                            //     keyboardType: TextInputType.number,
                            //     decoration: const InputDecoration(
                            //       prefixText: 'Rp. ',
                            //     ),
                            //   ),
                            // ),
                            // DataCell(
                            //   FormBuilderTextField(
                            //     textAlign: TextAlign.right,
                            //     name: 'angsuranPokok',
                            //     readOnly: true,
                            //     controller: controller.angsuranPokok,
                            //     keyboardType: TextInputType.number,
                            //     decoration: const InputDecoration(
                            //       prefixText: 'Rp. ',
                            //     ),
                            //   ),
                            // ),
                            DataCell(
                              FormBuilderTextField(
                                textAlign: TextAlign.right,
                                name: 'jumlahAngsuran',
                                readOnly: true,
                                controller: controller.jumlahAngsuran,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  prefixText: 'Rp. ',
                                ),
                              ),
                            ),
                            // DataCell(
                            //   FormBuilderTextField(
                            //     textAlign: TextAlign.right,
                            //     name: 'saldo',
                            //     readOnly: true,
                            //     controller: controller.saldo,
                            //     keyboardType: TextInputType.number,
                            //     decoration: const InputDecoration(
                            //       prefixText: 'Rp. ',
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Simulasi Kredit'),
  //       actions: <Widget>[
  //         IconButton(
  //           icon: new Icon(Icons.home, color: Colors.white, size: 30),
  //           onPressed: () {
  //             Get.toNamed(Routes.HOME);
  //           },
  //         ),
  //       ],
  //     ),
  //     body: SingleChildScrollView(
  //       child: Container(
  //         padding: const EdgeInsets.all(16),
  //         child: FormBuilder(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               const Text(
  //                 'Simulasi Kredit',
  //                 style: TextStyle(
  //                   color: Color.fromARGB(255, 139, 171, 185),
  //                   fontSize: 30,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 20.0,
  //               ),
  //               Column(
  //                 children: [
  //                   const SizedBox(
  //                     height: 8.0,
  //                   ),
  //                   Row(
  //                     children: [
  //                       Expanded(
  //                           child: FormBuilderTextField(
  //                         name: 'jumlah_pinjaman',
  //                         decoration: const InputDecoration(
  //                           labelText: 'Jumlah Pinjaman',
  //                           border: OutlineInputBorder(
  //                             borderRadius: BorderRadius.all(
  //                               Radius.circular(10.0),
  //                             ),
  //                           ),
  //                         ),
  //                         keyboardType: TextInputType.number,
  //                       )),
  //                     ],
  //                   ),
  //                   const SizedBox(
  //                     height: 10.0,
  //                   ),
  //                   Row(
  //                     children: [
  //                       Expanded(
  //                           child: FormBuilderTextField(
  //                         name: 'jangka_waktu',
  //                         decoration: const InputDecoration(
  //                           labelText: 'Jangka Waktu (Bulan)',
  //                           border: OutlineInputBorder(
  //                             borderRadius: BorderRadius.all(
  //                               Radius.circular(10.0),
  //                             ),
  //                           ),
  //                         ),
  //                         keyboardType: TextInputType.number,
  //                       )),
  //                     ],
  //                   ),
  //                   const SizedBox(
  //                     height: 10.0,
  //                   ),
  //                   Row(
  //                     children: [
  //                       Expanded(
  //                           child: FormBuilderTextField(
  //                         name: 'bunga_efektif',
  //                         decoration: const InputDecoration(
  //                           labelText: 'Bunga (%) Efektif',
  //                           border: OutlineInputBorder(
  //                             borderRadius: BorderRadius.all(
  //                               Radius.circular(10.0),
  //                             ),
  //                           ),
  //                         ),
  //                         keyboardType: TextInputType.number,
  //                       )),
  //                     ],
  //                   ),
  //                   const SizedBox(
  //                     height: 20.0,
  //                   ),
  //                   ElevatedButton(
  //                     style: ElevatedButton.styleFrom(
  //                         shape: const StadiumBorder(),
  //                         padding: const EdgeInsets.symmetric(
  //                             vertical: 10, horizontal: 80),
  //                         textStyle: const TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 20,
  //                         )),
  //                     onPressed: () {},
  //                     child: const Text('Cek Simulasi'),
  //                   )
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
