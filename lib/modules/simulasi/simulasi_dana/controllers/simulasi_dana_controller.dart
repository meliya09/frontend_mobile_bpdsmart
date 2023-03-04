import 'dart:io';

import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class SimulasiDanaController extends GetxController {
  var year = 12;
  var month = TextEditingController();
  var depositoAwal = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var sukuBunga = TextEditingController();
  var pajakBunga = TextEditingController(text: '20');

  var newDepositoAwal = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var bungaBruto = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var pajakBungaResult = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);

  var bungaNetto = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var depositoAkhirA = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  void result() {
    hitungBungaBruto();
    hitungPajakBunga();
    hitungBungaNettot();
    depositoAkhirAA();
    hitungDepositoAwalNew();
  }

  void hitungBungaBruto() {
    final parseDepositoAwal =
        double.parse(depositoAwal.text.replaceAll('.', ''));
    final parseSukuBunga = double.parse(sukuBunga.text);
    final parseMonth = double.parse(month.text);

    final a = parseDepositoAwal;
    final b = (parseSukuBunga / 100) / 12;
    final c = parseMonth;

    final hasilBungaBruto = a * b * c;

    bungaBruto.text = hasilBungaBruto.toStringAsFixed(0);
  }

  void hitungPajakBunga() {
    final parseBungaBruto = double.parse(bungaBruto.text.replaceAll('.', ''));
    final parsePajakBunga = double.parse(pajakBunga.text);

    final a = parseBungaBruto;
    final b = parsePajakBunga / 100;

    final hasilPajakBunga = a * b;

    pajakBungaResult.text = hasilPajakBunga.toStringAsFixed(0);
  }

  void hitungBungaNettot() {
    final parseBungaBruto = double.parse(bungaBruto.text.replaceAll('.', ''));
    final parsePajakBunga = double.parse(pajakBunga.text);

    final a = parseBungaBruto;
    final b = parseBungaBruto * (parsePajakBunga / 100);

    final hasilBungaNettot = a - b;

    bungaNetto.text = hasilBungaNettot.toStringAsFixed(0);
  }

  void depositoAkhirAA() {
    final parseMonth = double.parse(month.text.replaceAll('.', ''));
    final parseBungaNettot = double.parse(bungaNetto.text.replaceAll('.', ''));

    final a = parseBungaNettot;
    final b = parseMonth;

    final hasilDepositoAkhir = a / b;

    depositoAkhirA.text = hasilDepositoAkhir.toStringAsFixed(0);
    // final parseDepositoAwal =
    //     double.parse(depositoAwal.text.replaceAll('.', ''));
    // final parseBungaNettot = double.parse(bungaNetto.text.replaceAll('.', ''));

    // final a = parseDepositoAwal;
    // final b = parseBungaNettot;

    // final hasilDepositoAkhir = a + b;

    // depositoAkhirA.text = hasilDepositoAkhir.toStringAsFixed(0);
  }

  void hitungDepositoAwalNew() {
    final parseDepositoAwal =
        double.parse(depositoAwal.text.replaceAll('.', ''));
    final parseBungaNettot = double.parse(bungaNetto.text.replaceAll('.', ''));

    final a = parseDepositoAwal;
    final b = parseBungaNettot;

    final hasilDepositoAwalNew = a + b;

    newDepositoAwal.text = hasilDepositoAwalNew.toStringAsFixed(0);
  }

  List<Widget> generateRowBasedOnMonth() {
    var list = <Widget>[];
    for (var i = 0; i < year; i++) {
      list.add(
        Row(
          children: [
            Text('Bulan ke-$i'),
            const Text('Rp. 0'),
          ],
        ),
      );
    }
    return list;
  }

  Future<Uint8List> getPDF() async {
    // buat class pdf
    final pdf = pw.Document();

    // my font
    var dataFont = await rootBundle.load("fonts/RoadRage-Regular.ttf");
    var myFont = pw.Font.ttf(dataFont);

    // my images
    // var dataImage = await rootBundle.load("assets/image.jpg");
    // var myImage = dataImage.buffer.asUint8List();

    // buat pages
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.ClipRRect(
              horizontalRadius: 20,
              verticalRadius: 20,
              child: pw.Container(
                width: 350,
                height: 270,
                // child: pw.Image(
                //   pw.MemoryImage(myImage),
                //   fit: pw.BoxFit.cover,
                // ),
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Container(
              color: PdfColors.red800,
              alignment: pw.Alignment.center,
              width: double.infinity,
              child: pw.Text(
                "MY PRODUCTS",
                style: pw.TextStyle(
                  fontSize: 50,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.white,
                  font: myFont,
                ),
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Table(
              border: pw.TableBorder.all(),
              children: [
                pw.TableRow(
                  children: [
                    pw.Container(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        "No",
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.white,
                          font: myFont,
                        ),
                      ),
                      color: PdfColors.red800,
                    ),
                    pw.Container(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        "Name",
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.white,
                          font: myFont,
                        ),
                      ),
                      color: PdfColors.red800,
                    ),
                    pw.Container(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        "Price",
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.white,
                          font: myFont,
                        ),
                      ),
                      color: PdfColors.red800,
                    ),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Container(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        "1",
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black,
                          font: myFont,
                        ),
                      ),
                    ),
                    pw.Container(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        "Product 1",
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black,
                          font: myFont,
                        ),
                      ),
                    ),
                    pw.Container(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        "Rp. 100.000",
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black,
                          font: myFont,
                        ),
                      ),
                    ),
                  ],
                ),
                pw.TableRow(
                  children: [
                    pw.Container(
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                        "2",
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black,
                          font: myFont,
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
            //             font: myFont,
            //           ),
            //         ),
            //       )
            //       .toList(),
            // ),
          ];
        },
      ),
    );
    return pdf.save(); // Page

    // simpan
    // Uint8List bytes = await pdf.save();

    // // buat file kosong di direktori
    // final dir = await getApplicationDocumentsDirectory();
    // final file = File('${dir.path}/mydocument.pdf');

    // // timpa file kosong dengan file pdf
    // await file.writeAsBytes(bytes);

    // // open pdf
    // await OpenFile.open(file.path);
  }
}
