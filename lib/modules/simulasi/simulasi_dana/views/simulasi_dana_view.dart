// import 'dart:js';

import 'package:bpdsmart_diy/modules/simulasi/simulasi_dana/views/pdfexport/pdfpreview.dart';
import 'package:data_table_2/data_table_2.dart';

import 'package:flutter/material.dart';

// import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

import '../../../../app/routes/app_pages.dart';
import '../controllers/simulasi_dana_controller.dart';

class SimulasiDanaView extends GetView<SimulasiDanaController> {
  SimulasiDanaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          // onPressed: _displayPdf,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PdfPreviewPage(),
              ),
            );
            // rootBundle.
          },
          // onPressed: () => controller.getPDF(),

          child: Icon(Icons.picture_as_pdf),
        ),
        appBar: AppBar(
          title: const Text('Simulasi Deposito'),
          actions: [
            IconButton(
              icon: new Icon(Icons.home, color: Colors.white, size: 30),
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
                    'Informasi Bunga(%)',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 200,
                    child: DataTable(
                      headingRowColor: MaterialStateColor.resolveWith(
                          (Set<MaterialState> states) =>
                              Color.fromARGB(255, 121, 136, 148)),
                      columnSpacing: 8,
                      horizontalMargin: 15,
                      dividerThickness: 1,
                      sortAscending: true,
                      border: TableBorder.all(color: Colors.black),
                      columns: const [
                        DataColumn(label: Text('Jangka Waktu')),
                        DataColumn(label: Text('< Rp100 juta')),
                        DataColumn(label: Text('Rp100 juta s.d < Rp1 Milyar')),
                        DataColumn(label: Text('>= Rp1 Milyar')),
                      ],
                      rows: const [
                        DataRow(
                          cells: [
                            DataCell(Text('1 bulan')),
                            DataCell(Text('2,75%')),
                            DataCell(Text('2,75%')),
                            DataCell(Text('2,75%')),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text('3 bulan')),
                            DataCell(Text('2,75%')),
                            DataCell(Text('2,75%')),
                            DataCell(Text('2,75%')),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text('6 bulan')),
                            DataCell(Text('2,75%')),
                            DataCell(Text('2,75%')),
                            DataCell(Text('3,00%')),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(Text('12 bulan')),
                            DataCell(Text('2,75%')),
                            DataCell(Text('2,75%')),
                            DataCell(Text('3,00%')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    'Simulasi Deposito',
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
                          // validator: FormBuilderValidators.required(),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Jangka waktu is Required';
                            }
                            return null;
                          },
                          controller: controller.month,
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
                          // validator: FormBuilderValidators.required(),

                          // validator: FormBuilderValidators.compose([
                          //   FormBuilderValidators.required(),
                          //   FormBuilderValidators.numeric(),
                          //   FormBuilderValidators.match(
                          //     r'^([0-9.0-9])$',
                          //     errorText: 'Harus titik',
                          //   ),
                          // ]),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Suku Bunga is Required';
                            }

                            if (!RegExp(r'^[0-9\.\0.9]+$').hasMatch(value)) {
                              return 'Suku bunga harus dengan titik ';
                            }

                            return null;
                          },

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
                        name: 'pajakBunga',
                        // validator: FormBuilderValidators.required(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Pajak bunga is Required';
                          }
                          return null;
                        },
                        textAlign: TextAlign.right,
                        controller: controller.pajakBunga,
                        decoration: const InputDecoration(
                            labelText: 'Pajak Bunga',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            suffixText: '%'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      FormBuilderTextField(
                        name: 'depositAwal',
                        // validator: FormBuilderValidators.required(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nominal deposito is Required';
                          }
                          return null;
                        },
                        controller: controller.depositoAwal,
                        decoration: const InputDecoration(
                          labelText: 'Nominal Deposito',
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
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      minWidth: 800,
                      dividerThickness: 1,
                      sortAscending: true,
                      border: TableBorder.all(color: Colors.black),
                      bottomMargin: 5,
                      sortColumnIndex: 0,
                      columns: const [
                        DataColumn2(
                            label: Text('Jangka Waktu'), size: ColumnSize.S),
                        DataColumn2(label: Text('Nominal Deposito')),
                        DataColumn2(label: Text('Bunga Bruto')),
                        DataColumn2(label: Text('Pajak Bunga')),
                        DataColumn2(label: Text('Bunga Netto')),
                        DataColumn2(label: Text('Penerimaan per Bulan')),
                      ],
                      rows: [
                        DataRow2(
                          cells: [
                            DataCell(
                              FormBuilderTextField(
                                name: 'bulan1',
                                readOnly: true,
                                controller: controller.month,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(),
                              ),
                            ),
                            DataCell(
                              FormBuilderTextField(
                                textAlign: TextAlign.right,
                                name: 'depositoAwal',
                                readOnly: true,
                                controller: controller.depositoAwal,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  prefixText: 'Rp. ',
                                ),
                              ),
                            ),
                            DataCell(
                              FormBuilderTextField(
                                textAlign: TextAlign.right,
                                name: 'angsuranPokok1',
                                readOnly: true,
                                controller: controller.bungaBruto,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  prefixText: 'Rp. ',
                                ),
                              ),
                            ),
                            DataCell(
                              FormBuilderTextField(
                                textAlign: TextAlign.right,
                                name: 'angsuranBunga1',
                                readOnly: true,
                                controller: controller.pajakBungaResult,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  prefixText: 'Rp. ',
                                ),
                              ),
                            ),
                            DataCell(
                              FormBuilderTextField(
                                textAlign: TextAlign.right,
                                name: 'jumlahAngsuran1',
                                readOnly: true,
                                controller: controller.bungaNetto,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  prefixText: 'Rp. ',
                                ),
                              ),
                            ),
                            DataCell(
                              FormBuilderTextField(
                                textAlign: TextAlign.right,
                                name: 'saldo1',
                                readOnly: true,
                                controller: controller.depositoAkhirA,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  prefixText: 'Rp. ',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

//example 2
  /// create PDF & print it
//   void _createPdf() async {
//     final doc = pw.Document();

//     /// for using an image from assets
//     // final image = await imageFromAssetBundle('assets/image.png');

//     doc.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (pw.Context context) {
//           return pw.Center(
//             child: pw.Text('Hello eclectify Enthusiast'),
//           ); // Center
//         },
//       ),
//     ); // Page

//     /// print the document using the iOS or Android print service:
//     await Printing.layoutPdf(
//         onLayout: (PdfPageFormat format) async => doc.save());

//     /// share the document to other applications:
//     // await Printing.sharePdf(bytes: await doc.save(), filename: 'my-document.pdf');

//     /// tutorial for using path_provider: https://www.youtube.com/watch?v=fJtFDrjEvE8
//     /// save PDF with Flutter library "path_provider":
//     // final output = await getTemporaryDirectory();
//     // final file = File('${output.path}/example.pdf');
//     // await file.writeAsBytes(await doc.save());
//   }

//   /// display a pdf document.
//   void _displayPdf() {
//     final doc = pw.Document();
//     final BuildContext context = Get.context!;
//     final DataTable2;
//     doc.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (pw.Context context) {
//           return pw.Column(children: [
//             // SizedBox(
//             //   height: 400,
//             //   child: DataTable2(
//             //     headingRowColor: MaterialStateColor.resolveWith(
//             //         (Set<MaterialState> states) =>
//             //             Color.fromARGB(255, 5, 73, 129)),
//             //     columnSpacing: 12,
//             //     horizontalMargin: 12,
//             //     minWidth: 800,
//             //     dividerThickness: 1,
//             //     sortAscending: true,
//             //     border: TableBorder.all(color: Colors.black),
//             //     bottomMargin: 5,
//             //     sortColumnIndex: 0,
//             //     columns: const [
//             //       DataColumn2(label: Text('Jangka Waktu'), size: ColumnSize.S),
//             //       DataColumn2(label: Text('Nominal Deposito')),
//             //       DataColumn2(label: Text('Bunga Bruto')),
//             //       DataColumn2(label: Text('Pajak Bunga')),
//             //       DataColumn2(label: Text('Bunga Netto')),
//             //       DataColumn2(label: Text('Penerimaan per Bulan')),
//             //     ],
//             //     rows: [
//             //       DataRow2(
//             //         cells: [
//             //           DataCell(
//             //             FormBuilderTextField(
//             //               name: 'bulan1',
//             //               readOnly: true,
//             //               controller: controller.month,
//             //               keyboardType: TextInputType.number,
//             //               decoration: const InputDecoration(),
//             //             ),
//             //           ),
//             //           DataCell(
//             //             FormBuilderTextField(
//             //               textAlign: TextAlign.right,
//             //               name: 'depositoAwal',
//             //               readOnly: true,
//             //               controller: controller.depositoAwal,
//             //               keyboardType: TextInputType.number,
//             //               decoration: const InputDecoration(
//             //                 prefixText: 'Rp. ',
//             //               ),
//             //             ),
//             //           ),
//             //           DataCell(
//             //             FormBuilderTextField(
//             //               textAlign: TextAlign.right,
//             //               name: 'angsuranPokok1',
//             //               readOnly: true,
//             //               controller: controller.bungaBruto,
//             //               keyboardType: TextInputType.number,
//             //               decoration: const InputDecoration(
//             //                 prefixText: 'Rp. ',
//             //               ),
//             //             ),
//             //           ),
//             //           DataCell(
//             //             FormBuilderTextField(
//             //               textAlign: TextAlign.right,
//             //               name: 'angsuranBunga1',
//             //               readOnly: true,
//             //               controller: controller.pajakBungaResult,
//             //               keyboardType: TextInputType.number,
//             //               decoration: const InputDecoration(
//             //                 prefixText: 'Rp. ',
//             //               ),
//             //             ),
//             //           ),
//             //           DataCell(
//             //             FormBuilderTextField(
//             //               textAlign: TextAlign.right,
//             //               name: 'jumlahAngsuran1',
//             //               readOnly: true,
//             //               controller: controller.bungaNetto,
//             //               keyboardType: TextInputType.number,
//             //               decoration: const InputDecoration(
//             //                 prefixText: 'Rp. ',
//             //               ),
//             //             ),
//             //           ),
//             //           DataCell(
//             //             FormBuilderTextField(
//             //               textAlign: TextAlign.right,
//             //               name: 'saldo1',
//             //               readOnly: true,
//             //               controller: controller.depositoAkhirA,
//             //               keyboardType: TextInputType.number,
//             //               decoration: const InputDecoration(
//             //                 prefixText: 'Rp. ',
//             //               ),
//             //             ),
//             //           ),
//             //         ],
//             //       ),
//             //     ],
//             //   ),
//             // ),

//             pw.Row(
//               mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//               children: [
//                 pw.Column(
//                   children: [
//                     // Text('Attention to: ${simulasiModel.kontenJudul}'),
//                     // Text(simulasiModel.address),
//                   ],
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 ),
//                 // SizedBox(
//                 //   height: 150,
//                 //   width: 150,
//                 //   child: Image(imageLogo),
//                 // )
//               ],
//             ),
//             pw.Container(height: 50),
//             pw.Table(
//               border: pw.TableBorder.all(color: PdfColors.black),
//               children: [
//                 pw.TableRow(
//                   children: [
//                     pw.Padding(
//                       child: pw.Text(
//                         'INVOICE FOR PAYMENT',
//                         style: pw.TextStyle(
//                           fontSize: 20,
//                           fontWeight: pw.FontWeight.bold,
//                         ),
//                         textAlign: pw.TextAlign.center,
//                       ),
//                       padding: pw.EdgeInsets.all(20),
//                     ),
//                   ],
//                 ),
//                 // ...invoice.items.map(
//                 //   (e) => TableRow(
//                 //     children: [
//                 //       Expanded(
//                 //         child: PaddedText(e.description),
//                 //         flex: 2,
//                 //       ),
//                 //       Expanded(
//                 //         child: PaddedText("\$${e.cost}"),
//                 //         flex: 1,
//                 //       )
//                 //     ],
//                 //   ),
//                 // ),
//                 // TableRow(
//                 //   children: [
//                 //     PaddedText('TAX', align: TextAlign.right),
//                 //     // PaddedText('\$${(invoice.totalCost() * 0.1).toStringAsFixed(2)}'),
//                 //   ],
//                 // ),
//                 // TableRow(
//                 //   children: [PaddedText('TOTAL', align: TextAlign.right), PaddedText('\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')],
//                 // )
//               ],
//             ),
//             // Padding(
//             //   child: Text(
//             //     "THANK YOU FOR YOUR CUSTOM!",
//             //     style: Theme.of(context).header2,
//             //   ),
//             //   padding: EdgeInsets.all(20),
//             // ),
//             // Text(
//             //     "Please forward the below slip to your accounts payable department."),
//             // Divider(
//             //   height: 1,
//             //   borderStyle: BorderStyle.dashed,
//             // ),
//             pw.Container(height: 50),
//             pw.Table(
//               border: pw.TableBorder.all(color: PdfColors.black),
//               children: [
//                 pw.TableRow(
//                   children: [
//                     pw.Text('Jangka Waktu'),
//                     pw.Text(
//                       'Nominal Deposito',
//                     ),
//                     pw.Text('Bunga Bruto'),
//                     pw.Text('Pajak Bunga'),
//                     pw.Text('Bunga Netto'),
//                     pw.Text('Penerimaan per Bulan')
//                   ],
//                 ),
//                 pw.TableRow(
//                   children: [
//                     pw.Text(
//                       'Account Name',
//                     ),
//                     pw.Text(
//                       'ADAM FAMILY TRUST',
//                     )
//                   ],
//                 ),
//                 pw.TableRow(
//                   children: [
//                     pw.Text(
//                       'Total Amount to be Paid',
//                     ),
//                     // PaddedText('\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
//                   ],
//                 )
//               ],
//             ),
//             pw.Padding(
//               padding: pw.EdgeInsets.all(30),
//               child: pw.Text(
//                 'Please ensure all cheques are payable to the ADAM FAMILY TRUST.',
//                 style: pw.TextStyle(
//                   fontSize: 20,
//                   fontWeight: pw.FontWeight.bold,
//                 ),
//               ),
//             ),
//           ]

//               // child: pw.Text(
//               //   'Hello eclectify Enthusiast',
//               //   style: pw.TextStyle(fontSize: 30),
//               // ),

//               // child: pw.DataTable2(
//               //   headingRowColor: MaterialStateColor.resolveWith(
//               //       (Set<MaterialState> states) =>
//               //           Color.fromARGB(255, 5, 73, 129)),
//               //   columnSpacing: 12,
//               //   horizontalMargin: 12,
//               //   minWidth: 800,
//               //   dividerThickness: 1,
//               //   sortAscending: true,
//               //   border: TableBorder.all(color: Colors.black),
//               //   bottomMargin: 5,
//               //   sortColumnIndex: 0,
//               //   columns: const [
//               //     DataColumn2(label: Text('Jangka Waktu'), size: ColumnSize.S),
//               //     DataColumn2(label: Text('Nominal Deposito')),
//               //     DataColumn2(label: Text('Bunga Bruto')),
//               //     DataColumn2(label: Text('Pajak Bunga')),
//               //     DataColumn2(label: Text('Bunga Netto')),
//               //     DataColumn2(label: Text('Penerimaan per Bulan')),
//               //   ],
//               //   rows: [
//               //     DataRow2(
//               //       cells: [
//               //         DataCell(
//               //           FormBuilderTextField(
//               //             name: 'bulan1',
//               //             readOnly: true,
//               //             controller: controller.month,
//               //             keyboardType: TextInputType.number,
//               //             decoration: const InputDecoration(),
//               //           ),
//               //         ),
//               //         DataCell(
//               //           FormBuilderTextField(
//               //             textAlign: TextAlign.right,
//               //             name: 'depositoAwal',
//               //             readOnly: true,
//               //             controller: controller.depositoAwal,
//               //             keyboardType: TextInputType.number,
//               //             decoration: const InputDecoration(
//               //               prefixText: 'Rp. ',
//               //             ),
//               //           ),
//               //         ),
//               //         DataCell(
//               //           FormBuilderTextField(
//               //             textAlign: TextAlign.right,
//               //             name: 'angsuranPokok1',
//               //             readOnly: true,
//               //             controller: controller.bungaBruto,
//               //             keyboardType: TextInputType.number,
//               //             decoration: const InputDecoration(
//               //               prefixText: 'Rp. ',
//               //             ),
//               //           ),
//               //         ),
//               //         DataCell(
//               //           FormBuilderTextField(
//               //             textAlign: TextAlign.right,
//               //             name: 'angsuranBunga1',
//               //             readOnly: true,
//               //             controller: controller.pajakBungaResult,
//               //             keyboardType: TextInputType.number,
//               //             decoration: const InputDecoration(
//               //               prefixText: 'Rp. ',
//               //             ),
//               //           ),
//               //         ),
//               //         DataCell(
//               //           FormBuilderTextField(
//               //             textAlign: TextAlign.right,
//               //             name: 'jumlahAngsuran1',
//               //             readOnly: true,
//               //             controller: controller.bungaNetto,
//               //             keyboardType: TextInputType.number,
//               //             decoration: const InputDecoration(
//               //               prefixText: 'Rp. ',
//               //             ),
//               //           ),
//               //         ),
//               //         DataCell(
//               //           FormBuilderTextField(
//               //             textAlign: TextAlign.right,
//               //             name: 'saldo1',
//               //             readOnly: true,
//               //             controller: controller.depositoAkhirA,
//               //             keyboardType: TextInputType.number,
//               //             decoration: const InputDecoration(
//               //               prefixText: 'Rp. ',
//               //             ),
//               //           ),
//               //         ),
//               //       ],
//               //     ),
//               //   ],
//               // ),

//               );
//         },
//       ),
//     );

//     /// open Preview Screen
//     // Navigator.push(context, MaterialPageRoute(builder:
//     //     (context) => PreviewScreen(doc: doc),));
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => PreviewScreen(doc: doc),
//       ),
//     );

//     Widget PaddedText(
//       final String text, {
//       final TextAlign align = TextAlign.left,
//     }) =>
//         Padding(
//           padding: EdgeInsets.all(10),
//           child: Text(
//             text,
//             textAlign: align,
//           ),
//         );
//   }

//   /// Convert a Pdf to images, one image per page, get only pages 1 and 2 at 72 dpi
//   void _convertPdfToImages(pw.Document doc) async {
//     await for (var page
//         in Printing.raster(await doc.save(), pages: [0, 1], dpi: 72)) {
//       final image = page.toImage(); // ...or page.toPng()
//       print(image);
//     }
//   }

//   /// print an existing Pdf file from a Flutter asset
//   void _printExistingPdf() async {
//     // import 'package:flutter/services.dart';
//     final pdf = await rootBundle.load('assets/document.pdf');
//     await Printing.layoutPdf(onLayout: (_) => pdf.buffer.asUint8List());
//   }

//   /// more advanced PDF styling
//   Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
//     final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
//     final font = await PdfGoogleFonts.nunitoExtraLight();

//     pdf.addPage(
//       pw.Page(
//         pageFormat: format,
//         build: (context) {
//           return pw.Column(
//             children: [
//               pw.SizedBox(
//                 width: double.infinity,
//                 child: pw.FittedBox(
//                   child: pw.Text(title, style: pw.TextStyle(font: font)),
//                 ),
//               ),
//               pw.SizedBox(height: 20),
//               pw.Flexible(child: pw.FlutterLogo())
//             ],
//           );
//         },
//       ),
//     );
//     return pdf.save();
//   }

//   void generatePdf() async {
//     const title = 'eclectify Demo';
//     await Printing.layoutPdf(onLayout: (format) => _generatePdf(format, title));
//   }
// }

// class PreviewScreen extends StatelessWidget {
//   final pw.Document doc;

//   const PreviewScreen({
//     Key? key,
//     required this.doc,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: Icon(Icons.arrow_back_outlined),
//         ),
//         centerTitle: true,
//         title: Text("Preview"),
//       ),
//       body: PdfPreview(
//         build: (format) => doc.save(),
//         allowSharing: true,
//         allowPrinting: true,
//         initialPageFormat: PdfPageFormat.a4,
//         pdfFileName: "mydoc.pdf",
//       ),
//     );
//   }

//example 3
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Simulasi Deposito'),
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
  //                 'Simulasi Deposito',
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
  //                     height: 10.0,
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
