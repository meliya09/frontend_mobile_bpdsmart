import 'dart:typed_data';

import 'package:bpdsmart_diy/models/SimulasiModel.dart';
import 'package:bpdsmart_diy/modules/simulasi/simulasi_dana/views/simulasi_dana_view.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

import '../../../controllers/simulasi_dana_controller.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

Future<Uint8List> makePdf() async {
  final pdf = Document();

  // final imageLogo = MemoryImage(
  //     (await rootBundle.load('assets/technical_logo.png'))
  //         .buffer
  //         .asUint8List());

  pdf.addPage(
    MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (Context context) {
        return [
          ClipRRect(
            horizontalRadius: 20,
            verticalRadius: 20,
            child: Container(
              width: 350,
              height: 270,
              // child: pw.Image(
              //   pw.MemoryImage(myImage),
              //   fit: pw.BoxFit.cover,
              // ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            color: PdfColors.red800,
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              "MY PRODUCTS",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: PdfColors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "No",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.white,
                      ),
                    ),
                    color: PdfColors.red800,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Name",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.white,
                      ),
                    ),
                    color: PdfColors.red800,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Price",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.white,
                      ),
                    ),
                    color: PdfColors.red800,
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "1",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Product 1",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Rp. 100.000",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "2",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // pw.Column(
          //   children: products
          //       .map(
          //         (e) => pw.Text(
          //           "ID : ${e['id']} - ${e['name']}\n${e['desc']}\n\n",
          //           style: pw.TextStyle(
          //             fontSize: 30,
          //
          //           ),
          //         ),
          //       )
          //       .toList(),
          // ),
        ];
      },
    ),
  );

  // pdf.addPage(
  //   Page(
  //     build: (Context context) {
  //       return Column(
  //         children: [
  //           SizedBox(
  //             height: 20.0,
  //           ),
  //           // SizedBox(
  //           //   height: 400,
  //           //   child: DataTable2(
  //           //     headingRowColor: MaterialStateColor.resolveWith(
  //           //         (Set<MaterialState> states) =>
  //           //             Color.fromARGB(255, 5, 73, 129)),
  //           //     columnSpacing: 12,
  //           //     horizontalMargin: 12,
  //           //     minWidth: 800,
  //           //     dividerThickness: 1,
  //           //     sortAscending: true,
  //           //     border: TableBorder.all(color: Colors.black),
  //           //     bottomMargin: 5,
  //           //     sortColumnIndex: 0,
  //           //     columns: const [
  //           //       DataColumn2(label: Text('Jangka Waktu'), size: ColumnSize.S),
  //           //       DataColumn2(label: Text('Nominal Deposito')),
  //           //       DataColumn2(label: Text('Bunga Bruto')),
  //           //       DataColumn2(label: Text('Pajak Bunga')),
  //           //       DataColumn2(label: Text('Bunga Netto')),
  //           //       DataColumn2(label: Text('Penerimaan per Bulan')),
  //           //     ],
  //           //     rows: [
  //           //       DataRow2(
  //           //         cells: [
  //           //           DataCell(
  //           //             FormBuilderTextField(
  //           //               name: 'bulan1',
  //           //               readOnly: true,
  //           //               controller: controller.month,
  //           //               keyboardType: TextInputType.number,
  //           //               decoration: const InputDecoration(),
  //           //             ),
  //           //           ),
  //           //           DataCell(
  //           //             FormBuilderTextField(
  //           //               textAlign: TextAlign.right,
  //           //               name: 'depositoAwal',
  //           //               readOnly: true,
  //           //               controller: controller.depositoAwal,
  //           //               keyboardType: TextInputType.number,
  //           //               decoration: const InputDecoration(
  //           //                 prefixText: 'Rp. ',
  //           //               ),
  //           //             ),
  //           //           ),
  //           //           DataCell(
  //           //             FormBuilderTextField(
  //           //               textAlign: TextAlign.right,
  //           //               name: 'angsuranPokok1',
  //           //               readOnly: true,
  //           //               controller: controller.bungaBruto,
  //           //               keyboardType: TextInputType.number,
  //           //               decoration: const InputDecoration(
  //           //                 prefixText: 'Rp. ',
  //           //               ),
  //           //             ),
  //           //           ),
  //           //           DataCell(
  //           //             FormBuilderTextField(
  //           //               textAlign: TextAlign.right,
  //           //               name: 'angsuranBunga1',
  //           //               readOnly: true,
  //           //               controller: controller.pajakBungaResult,
  //           //               keyboardType: TextInputType.number,
  //           //               decoration: const InputDecoration(
  //           //                 prefixText: 'Rp. ',
  //           //               ),
  //           //             ),
  //           //           ),
  //           //           DataCell(
  //           //             FormBuilderTextField(
  //           //               textAlign: TextAlign.right,
  //           //               name: 'jumlahAngsuran1',
  //           //               readOnly: true,
  //           //               controller: controller.bungaNetto,
  //           //               keyboardType: TextInputType.number,
  //           //               decoration: const InputDecoration(
  //           //                 prefixText: 'Rp. ',
  //           //               ),
  //           //             ),
  //           //           ),
  //           //           DataCell(
  //           //             FormBuilderTextField(
  //           //               textAlign: TextAlign.right,
  //           //               name: 'saldo1',
  //           //               readOnly: true,
  //           //               controller: controller.depositoAkhirA,
  //           //               keyboardType: TextInputType.number,
  //           //               decoration: const InputDecoration(
  //           //                 prefixText: 'Rp. ',
  //           //               ),
  //           //             ),
  //           //           ),
  //           //         ],
  //           //       ),
  //           //     ],
  //           //   ),
  //           // ),

  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Column(
  //                 children: [
  //                   // Text('Attention to: ${simulasiModel.kontenJudul}'),
  //                   // Text(simulasiModel.address),
  //                 ],
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //               ),
  //               // SizedBox(
  //               //   height: 150,
  //               //   width: 150,
  //               //   child: Image(imageLogo),
  //               // )
  //             ],
  //           ),
  //           Container(height: 50),
  //           Table(
  //             border: TableBorder.all(color: PdfColors.black),
  //             children: [
  //               TableRow(
  //                 children: [
  //                   Padding(
  //                     child: Text(
  //                       'SIMULASI DEPOSITO PREVIEW',
  //                       style: Theme.of(context).header4,
  //                       textAlign: TextAlign.center,
  //                     ),
  //                     padding: EdgeInsets.all(20),
  //                   ),
  //                 ],
  //               ),
  //               // ...invoice.items.map(
  //               //   (e) => TableRow(
  //               //     children: [
  //               //       Expanded(
  //               //         child: PaddedText(e.description),
  //               //         flex: 2,
  //               //       ),
  //               //       Expanded(
  //               //         child: PaddedText("\$${e.cost}"),
  //               //         flex: 1,
  //               //       )
  //               //     ],
  //               //   ),
  //               // ),
  //               // TableRow(
  //               //   children: [
  //               //     PaddedText('TAX', align: TextAlign.right),
  //               //     // PaddedText('\$${(invoice.totalCost() * 0.1).toStringAsFixed(2)}'),
  //               //   ],
  //               // ),
  //               // TableRow(
  //               //   children: [PaddedText('TOTAL', align: TextAlign.right), PaddedText('\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')],
  //               // )
  //             ],
  //           ),
  //           // Padding(
  //           //   child: Text(
  //           //     "THANK YOU FOR YOUR CUSTOM!",
  //           //     style: Theme.of(context).header2,
  //           //   ),
  //           //   padding: EdgeInsets.all(20),
  //           // ),
  //           // Text(
  //           //     "Please forward the below slip to your accounts payable department."),
  //           // Divider(
  //           //   height: 1,
  //           //   borderStyle: BorderStyle.dashed,
  //           // ),
  //           Container(height: 50),
  //           Table(
  //             border: TableBorder.all(color: PdfColors.black),
  //             children: [
  //               TableRow(
  //                 children: [
  //                   PaddedText('Jangka Waktu'),
  //                   PaddedText(
  //                     'Nominal Deposito',
  //                   ),
  //                   PaddedText('Bunga Bruto'),
  //                   PaddedText('Pajak Bunga'),
  //                   PaddedText('Bunga Netto'),
  //                   PaddedText('Penerimaan per Bulan')
  //                 ],
  //               ),
  //               TableRow(
  //                 children: [
  //                   PaddedText(''),
  //                   PaddedText(
  //                     'ADAM FAMILY TRUST',
  //                   )
  //                 ],
  //               ),
  //               TableRow(
  //                 children: [
  //                   PaddedText(
  //                     'Total Amount to be Paid',
  //                   ),
  //                   // PaddedText('\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
  //                 ],
  //               )
  //             ],
  //           ),
  //           Padding(
  //             padding: EdgeInsets.all(30),
  //             child: Text(
  //               'Please ensure all cheques are payable to the ADAM FAMILY TRUST.',
  //               style: Theme.of(context).header3.copyWith(
  //                     fontStyle: FontStyle.italic,
  //                   ),
  //               textAlign: TextAlign.center,
  //             ),
  //           )
  //         ],
  //       );
  //     },
  //   ),
  // );
  return pdf.save();
}

Widget PaddedText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: align,
      ),
    );
