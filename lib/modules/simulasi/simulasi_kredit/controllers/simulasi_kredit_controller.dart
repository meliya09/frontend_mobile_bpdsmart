import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class SimulasiKreditController extends GetxController {
  var year = 12;
  var jumlahPinjam = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  var sukuBunga = TextEditingController();

  var newJumlahPinjam = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);

  var jumlahAngsuran = MoneyMaskedTextController(
      decimalSeparator: '', thousandSeparator: '.', precision: 0);
  final jangkaWaktu = TextEditingController();
  final angsuranBunga = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final saldo = MoneyMaskedTextController(
    initialValue: 0,
    thousandSeparator: '.',
    decimalSeparator: '',
    precision: 0,
  );
  final jumlahBayar = TextEditingController();
  final angsuranPokok = MoneyMaskedTextController(
    decimalSeparator: '',
    thousandSeparator: '.',
    precision: 0,
  );
  // final sumAngsuranPokok = MoneyMaskedTextController(
  //   initialValue: 0,
  //   decimalSeparator: '',
  //   thousandSeparator: '.',
  //   precision: 0,
  // );
  // final sumAngsuranBunga = MoneyMaskedTextController(
  //   initialValue: 0,
  //   decimalSeparator: '',
  //   thousandSeparator: '.',
  //   precision: 0,
  // );
  // final sumAngsuranTotal = MoneyMaskedTextController(
  //   initialValue: 0,
  //   decimalSeparator: '',
  //   thousandSeparator: '.',
  //   precision: 0,
  // );

  final formKey = GlobalKey<FormBuilderState>();

  void result() {
    hitungAngsuranBunga();
    hitungAngsuranPokok();
    hitungJumlahAngsuran();
    hitungSisaSaldo();
  }

  void hitungAngsuranBunga() {
    final parseJumlahPinjam =
        double.parse(jumlahPinjam.text.replaceAll('.', ''));
    final parseSukuBunga = double.parse(sukuBunga.text);
    final parseJangkaWaktu = double.parse(jangkaWaktu.text);

    final a = parseJumlahPinjam;
    final b = (parseSukuBunga / 100);
    final c = parseJangkaWaktu;

    final hasilAngsuranBunga = a * (b / c);

    angsuranBunga.text = hasilAngsuranBunga.toStringAsFixed(0);
  }

  void hitungAngsuranPokok() {
    final parseJumlahPinjam =
        double.parse(jumlahPinjam.text.replaceAll('.', ''));
    final parseJangkaWaktu = double.parse(jangkaWaktu.text);

    final a = parseJumlahPinjam;
    final b = parseJangkaWaktu;

    final hasilAngsuranPokok = a / b;

    angsuranPokok.text = hasilAngsuranPokok.toStringAsFixed(0);
  }

  void hitungJumlahAngsuran() {
    final parseAngsuranPokok =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    final parseAngsuranBunga =
        double.parse(angsuranBunga.text.replaceAll('.', ''));

    final hasilAngsuran = parseAngsuranPokok + parseAngsuranBunga;
    jumlahAngsuran.text = hasilAngsuran.toStringAsFixed(0);
  }

  void hitungSisaSaldo() {
    final parseAngsuranPokokForRemainingBalance =
        double.parse(angsuranPokok.text.replaceAll('.', ''));
    final parseSaldo = double.parse(saldo.text.replaceAll('.', ''));

    // if (parseSaldo - parseAngsuranPokokForRemainingBalance < 0) {
    //   saldo.text = '0';
    // } else {
    //   saldo.text = (parseSaldo - parseAngsuranPokokForRemainingBalance)
    //       .toStringAsFixed(0);
    // }
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
}
