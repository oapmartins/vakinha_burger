import 'package:get/get.dart';
import 'package:vakinha_burger/app/modules/home/home_bindings.dart';
import 'package:vakinha_burger/app/modules/home/home_page.dart';
import 'package:vakinha_burger/app/modules/product_detail/product_detail_bindings.dart';
import 'package:vakinha_burger/app/modules/product_detail/product_detail_page.dart';

class ProductDetailRouters {
  ProductDetailRouters._();
  static final routers = <GetPage>[
    GetPage(
      name: '/product_detail',
      binding: ProductDetailBindings(),
      page: () => ProductDetailPage(),
    ),
  ];
}
