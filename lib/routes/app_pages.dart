import 'package:bpdsmart_diy/modules/auth/auth.dart';
import 'package:bpdsmart_diy/modules/home/home.dart';
import 'package:bpdsmart_diy/modules/informasi/layer_two_info/bindings/layer_two_info_binding.dart';
import 'package:bpdsmart_diy/modules/informasi/layer_two_info/views/layer_two_info_view.dart';
import 'package:bpdsmart_diy/modules/informasi/product/views/product_info_view.dart';
import 'package:bpdsmart_diy/modules/me/cards/cards_screen.dart';
import 'package:bpdsmart_diy/modules/product_konven/detail_product_konven/bindings/detail_product_konven_binding.dart';
import 'package:bpdsmart_diy/modules/product_konven/detail_product_konven/views/detail_product_konven_view.dart';
import 'package:bpdsmart_diy/modules/product_konven/layer_one_konven/bindings/layer_one_syariah_binding.dart';
import 'package:bpdsmart_diy/modules/product_konven/layer_one_konven/views/layer_one_konven_view.dart';
import 'package:bpdsmart_diy/modules/product_konven/layer_three_konven/bindings/layer_three_konven_binding.dart';
import 'package:bpdsmart_diy/modules/product_konven/layer_three_konven/views/layer_three_konven_view.dart';
import 'package:bpdsmart_diy/modules/product_konven/layer_two_konven/bindings/layer_two_konven_binding.dart';
import 'package:bpdsmart_diy/modules/product_konven/layer_two_konven/views/layer_two_konven_view.dart';
import 'package:bpdsmart_diy/modules/product_konven/product_konven/bindings/product_konven_binding.dart';
import 'package:bpdsmart_diy/modules/product_konven/product_konven/views/product_konven_view.dart';
// import 'package:bpdsmart_diy/modules/product_konvensional/detail_product/bindings/detail_product_binding.dart';
// import 'package:bpdsmart_diy/modules/product_konvensional/detail_product/views/detail_product_view.dart';
// import 'package:bpdsmart_diy/modules/product_konvensional/layer_one/bindings/layer_one_binding.dart';
// import 'package:bpdsmart_diy/modules/product_konvensional/layer_one/views/layer_one_view.dart';
// import 'package:bpdsmart_diy/modules/product_konvensional/layer_three/bindings/layer_three_binding.dart';
// import 'package:bpdsmart_diy/modules/product_konvensional/layer_three/views/layer_three_view.dart';
// import 'package:bpdsmart_diy/modules/product_konvensional/layer_two/bindings/layer_two_binding.dart';
// import 'package:bpdsmart_diy/modules/product_konvensional/layer_two/views/layer_two_view.dart';
// import 'package:bpdsmart_diy/modules/product_konvensional/product/bindings/product_konven_binding.dart';
// import 'package:bpdsmart_diy/modules/product_konvensional/product/views/produk_konven_view.dart';

import 'package:bpdsmart_diy/modules/product_syariah/detail_product_syariah/bindings/detail_product_syariah_binding.dart';
import 'package:bpdsmart_diy/modules/product_syariah/detail_product_syariah/views/detail_product_syariah_view.dart';
import 'package:bpdsmart_diy/modules/product_syariah/layer_one_syariah/bindings/layer_one_syariah_binding.dart';
import 'package:bpdsmart_diy/modules/product_syariah/layer_one_syariah/views/layer_one_syariah_view.dart';
import 'package:bpdsmart_diy/modules/product_syariah/layer_three_syariah/bindings/layer_three_syariah_binding.dart';
import 'package:bpdsmart_diy/modules/product_syariah/layer_three_syariah/views/layer_three_syariah_view.dart';
import 'package:bpdsmart_diy/modules/product_syariah/layer_two_syariah/bindings/layer_two_syariah_binding.dart';
import 'package:bpdsmart_diy/modules/product_syariah/layer_two_syariah/views/layer_two_syariah_view.dart';
import 'package:bpdsmart_diy/modules/product_syariah/product/bindings/product_binding.dart';
import 'package:bpdsmart_diy/modules/product_syariah/product/views/product_syariah_view.dart';
import 'package:bpdsmart_diy/modules/product_syariah/product/controllers/product_syariah_controller.dart';

import 'package:bpdsmart_diy/modules/internal/detail_product_internal/bindings/detail_product_internal_binding.dart';
import 'package:bpdsmart_diy/modules/internal/detail_product_internal/views/detail_product_internal_view.dart';
import 'package:bpdsmart_diy/modules/internal/detail_product2_internal/bindings/detail_product2_binding.dart';
import 'package:bpdsmart_diy/modules/internal/detail_product_berita/views/detail_product_berita_view.dart';
import 'package:bpdsmart_diy/modules/internal/detail_product_berita/bindings/detail_product_berita_binding.dart';
import 'package:bpdsmart_diy/modules/internal/detail_product2_internal/views/detail_product2_view.dart';
import 'package:bpdsmart_diy/modules/internal/layer_one_internal/bindings/layer_one_internal_binding.dart';
import 'package:bpdsmart_diy/modules/internal/layer_one_internal/views/layer_one_internal_view.dart';
import 'package:bpdsmart_diy/modules/internal/layer_three_internal/bindings/layer_three_internal_binding.dart';
import 'package:bpdsmart_diy/modules/internal/layer_three_internal/views/layer_three_internal_view.dart';
import 'package:bpdsmart_diy/modules/internal/layer_two_internal/bindings/layer_two_internal_binding.dart';
import 'package:bpdsmart_diy/modules/internal/layer_two_internal/views/layer_two_internal_view.dart';
import 'package:bpdsmart_diy/modules/internal/product/bindings/product_internal_binding.dart';
import 'package:bpdsmart_diy/modules/internal/product/views/product_internal_view.dart';
import 'package:bpdsmart_diy/modules/internal/product/controllers/product_internal_controller.dart';

import 'package:bpdsmart_diy/modules/informasi/detail_product_info/bindings/detail_product_info_binding.dart';
import 'package:bpdsmart_diy/modules/informasi/detail_product_info/views/detail_product_info_view.dart';
import 'package:bpdsmart_diy/modules/informasi/layer_one_info/bindings/layer_one_info_binding.dart';
import 'package:bpdsmart_diy/modules/informasi/layer_one_info/views/layer_one_info_view.dart';
import 'package:bpdsmart_diy/modules/informasi/product/bindings/product_info_binding.dart';
import 'package:bpdsmart_diy/modules/informasi/product/views/product_info_view.dart';
import 'package:bpdsmart_diy/modules/informasi/product/controllers/product_info_controller.dart';

import 'package:bpdsmart_diy/modules/helpdesk/product/bindings/product_help_binding.dart';
import 'package:bpdsmart_diy/modules/helpdesk/product/views/product_help_view.dart';
import 'package:bpdsmart_diy/modules/helpdesk/product/controllers/product_help_controller.dart';
import 'package:bpdsmart_diy/modules/produk_konven/detail_konven/bindings/detail_konven_binding.dart';
import 'package:bpdsmart_diy/modules/produk_konven/detail_konven/views/detail_konven_view.dart';
import 'package:bpdsmart_diy/modules/produk_konven/layer_dua_konven/bindings/layer_dua_konven_binding.dart';
import 'package:bpdsmart_diy/modules/produk_konven/layer_dua_konven/views/layer_dua_konven_view.dart';
import 'package:bpdsmart_diy/modules/produk_konven/layer_satu_konven/bindings/layer_satu_konven_binding.dart';
import 'package:bpdsmart_diy/modules/produk_konven/layer_satu_konven/views/layer_satu_konven_view.dart';
import 'package:bpdsmart_diy/modules/produk_konven/layer_tiga_konven/bindings/layer_tiga_konven_binding.dart';
import 'package:bpdsmart_diy/modules/produk_konven/layer_tiga_konven/views/layer_tiga_konven_view.dart';
import 'package:bpdsmart_diy/modules/produk_konven/produk/bindings/produk_konven_binding.dart';
import 'package:bpdsmart_diy/modules/produk_konven/produk/views/produk_konven_view.dart';

import 'package:bpdsmart_diy/modules/simulasi/simulasi_dana/views/pdfexport/pdfpreview.dart';

import 'package:bpdsmart_diy/modules/splash/splash.dart';
import 'package:get/get.dart';

import '../modules/simulasi/product/bindings/product_simulasi_binding.dart';
import '../modules/simulasi/product/views/product_simulasi_view.dart';
import '../modules/simulasi/simulasi_dana/bindings/simulasi_dana_binding.dart';
import '../modules/simulasi/simulasi_dana/views/simulasi_dana_view.dart';
import '../modules/simulasi/simulasi_kredit/bindings/simulasi_kredit_binding.dart';
import '../modules/simulasi/simulasi_kredit/views/simulasi_kredit_view.dart';

import '../modules/simulasi/simulasi_dana/views/pdfexport/pdf/pdfexport.dart';

part 'app_routes.dart';

// class AppPages {
//   static const INITIAL = Routes.SPLASH;

//   static final routes = [
//     GetPage(
//       name: Routes.SPLASH,
//       page: () => SplashScreen(),
//       binding: SplashBinding(),
//     ),
//     GetPage(
//       name: Routes.AUTH,
//       page: () => AuthScreen(),
//       binding: AuthBinding(),
//       children: [
//         GetPage(name: Routes.REGISTER, page: () => RegisterScreen()),
//         GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
//       ],
//     ),
//     GetPage(
//         name: Routes.HOME,
//         page: () => HomeScreen(),
//         binding: HomeBinding(),
//         children: [
//           GetPage(name: Routes.CARDS, page: () => CardsScreen()),
//         ]),
//   ];
// }

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
      children: [
        GetPage(name: Routes.REGISTER, page: () => RegisterScreen()),
        GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
      ],
    ),
    GetPage(
        name: Routes.HOME,
        page: () => HomeScreen(),
        binding: HomeBinding(),
        children: [
          GetPage(name: Routes.CARDS, page: () => CardsScreen()),
        ]),

    //PRODUK KONVEN
    GetPage(
      name: _Paths.PRODUCT_KONVEN,
      page: () => ProductKonvenView(),
      binding: ProductKonvenBinding(),
    ),
    GetPage(
      name: _Paths.LAYER_ONE_KONVEN,
      page: () => LayerOneKonvenView(),
      binding: LayerOneKonvenBinding(),
    ),
    GetPage(
      name: _Paths.LAYER_TWO_KONVEN,
      page: () => LayerTwoKonvenView(),
      binding: LayerTwoKonvenBinding(),
    ),
    GetPage(
      name: _Paths.LAYER_THREE_KONVEN,
      page: () => const LayerThreeKonvenView(),
      binding: LayerThreeKonvenBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUCT_KONVEN,
      page: () => DetailProductKonvenView(),
      binding: DetailProductKonvenBinding(),
    ),

    //
    GetPage(
      name: _Paths.PRODUK_KONVEN,
      page: () => ProdukKonvenView(),
      binding: ProdukKonvenBinding(),
    ),
    GetPage(
      name: _Paths.LAYER_SATU_KONVEN,
      page: () => LayerSatuKonvenView(),
      binding: LayerSatuKonvenBinding(),
    ),
    GetPage(
      name: _Paths.LAYER_DUA_KONVEN,
      page: () => LayerDuaKonvenView(),
      binding: LayerDuaKonvenBinding(),
    ),
    GetPage(
      name: _Paths.LAYER_TIGA_KONVEN,
      page: () => const LayerTigaKonvenView(),
      binding: LayerTigaKonvenBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_KONVEN,
      page: () => DetailKonvenView(),
      binding: DetailKonvenBinding(),
    ),

    //Produk Syariah
    GetPage(
      name: _Paths.PRODUCT_SYARIAH,
      page: () => const ProductSyariahView(),
      binding: ProductSyariahBinding(),
    ),
    GetPage(
      name: _Paths.LAYER_ONE_SYARIAH,
      page: () => LayerOneSyariahView(),
      binding: LayerOneSyariahBinding(),
    ),
    GetPage(
      name: _Paths.LAYER_TWO_SYARIAH,
      page: () => LayerTwoSyariahView(),
      binding: LayerTwoSyariahBinding(),
    ),
    GetPage(
      name: _Paths.LAYER_THREE_SYARIAH,
      page: () => const LayerThreeSyariahView(),
      binding: LayerThreeSyariahBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUCT_SYARIAH,
      page: () => DetailProductSyariahView(),
      binding: DetailProductSyariahBinding(),
    ),

    //Internal
    GetPage(
      name: _Paths.INTERNAL,
      page: () => const ProductInternalView(),
      binding: ProductInternalBinding(),
    ),
    GetPage(
      name: _Paths.LAYER_ONE_INTERNAL,
      page: () => LayerOneInternalView(),
      binding: LayerOneInternalBinding(),
    ),
    GetPage(
      name: _Paths.LAYER_TWO_INTERNAL,
      page: () => LayerTwoInternalView(),
      binding: LayerTwoInternalBinding(),
    ),
    GetPage(
      name: _Paths.LAYER_THREE_INTERNAL,
      page: () => const LayerThreeInternalView(),
      binding: LayerThreeInternalBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUCT_INTERNAL,
      page: () => DetailProductInternalView(),
      binding: DetailProductInternalBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUCT2_INTERNAL,
      page: () => DetailProduct2InternalView(),
      binding: DetailProduct2InternalBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUCT_BERITA,
      page: () => DetailProductBeritaView(),
      binding: DetailProductBeritaBinding(),
    ),

    //Informasi
    GetPage(
      name: _Paths.INFORMASI,
      page: () => ProductInfoView(),
      binding: ProductInfoBinding(),
    ),
    GetPage(
      name: _Paths.LAYER_ONE_INFO,
      page: () => LayerOneInfoView(),
      binding: LayerOneInfoBinding(),
    ),
    GetPage(
      name: _Paths.LAYER_TWO_INFO,
      page: () => LayerTwoInfoView(),
      binding: LayerTwoInfoBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUCT_INFO,
      page: () => DetailProductInfoView(),
      binding: DetailProductInfoBinding(),
    ),

    //helpdesk
    GetPage(
      name: _Paths.HELPDESK,
      page: () => ProductHelpView(),
      binding: ProductHelpBinding(),
    ),

    //simulasi
    GetPage(
      name: _Paths.SIMULASI,
      page: () => ProductSimulasiView(),
      binding: ProductSimulasiBinding(),
    ),
    GetPage(
      name: _Paths.SIMULASI_DANA,
      page: () => SimulasiDanaView(),
      binding: SimulasiDanaBinding(),
    ),
    GetPage(
      name: _Paths.SIMULASI_KREDIT,
      page: () => SimulasiKreditView(),
      binding: SimulasiKreditBinding(),
    ),

    GetPage(
      name: _Paths.DETAIL_PAGE_LAYER_ONE,
      page: () => LayerOneKonvenView(),
      binding: LayerOneKonvenBinding(),
    ),
  ];
}
