import 'package:get/get.dart';
import 'package:vakinha_burger/app/modules/order/finished/finished_page.dart';

class OrderRouters {
  OrderRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/orders/finished',
      page: () => const FinishedPage(),
    ),
  ];
}
