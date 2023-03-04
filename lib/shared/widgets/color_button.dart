// 🐦 Flutter imports:
import 'package:bpdsmart_diy/common/style.dart';
import 'package:bpdsmart_diy/shared/constants/style.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:

Widget colorButton(BuildContext context, String name, Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      // width: MediaQuery.of(context).size.width - 50,
      height: 50,
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [grey300, grey400]),
          borderRadius: BorderRadius.circular(8),
          color: Colors.green),
      child: Center(
        child: Text(name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
      ),
    ),
  );
}
