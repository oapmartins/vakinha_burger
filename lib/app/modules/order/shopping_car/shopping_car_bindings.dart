import 'package:get/get.dart';
import 'package:vakinha_burger/app/repositories/order/order_repository.dart';
import 'package:vakinha_burger/app/repositories/order/order_repository_impl.dart';
import './shopping_car_controller.dart';

class ShoppingCarBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRepository>(
        () => OrderRepositoryImpl(restClient: Get.find()));

    Get.put(ShoppingCarController(
      authService: Get.find(),
      shoppingCarService: Get.find(),
      orderRepository: Get.find(),
    ));
  }
}
