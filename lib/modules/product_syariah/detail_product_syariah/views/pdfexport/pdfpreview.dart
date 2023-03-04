// import 'package:bpdsmart_diy/models/ProdukSyariah/syariah.dart';
// import 'package:bpdsmart_diy/modules/product_syariah/detail_product_syariah/views/detail_product_syariah_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// import 'package:printing/printing.dart';
// import 'pdf/pdfexport.dart';

// class PdfPreviewPage extends StatelessWidget {
//   const PdfPreviewPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detail Product Syariah Preview'),
//       ),
//       body: PdfPreview(
//         build: (context) => makePdf(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

class PdfPreviewScreen extends StatelessWidget {
  final String? path;

  PdfPreviewScreen({this.path});

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      path: path,
    );
  }
}
