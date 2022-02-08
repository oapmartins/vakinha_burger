import 'package:get/get.dart';
import 'package:vakinha_burger/app/modules/order/finished/finished_page.dart';
import 'package:vakinha_burger/app/modules/order/pix/pix_page.dart';

class OrderRouters {
  OrderRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/orders/finished',
      page: () => FinishedPage(),
    ),
    GetPage(
      name: '/orders/pix',
      page: () => PixPage(),
    ),
  ];
}
