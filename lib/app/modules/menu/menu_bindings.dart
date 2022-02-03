import 'package:get/get.dart';
import 'package:vakinha_burger/app/repositories/products/product_repositoy.dart';
import 'package:vakinha_burger/app/repositories/products/product_repositoy_impl.dart';
import './menu_controller.dart';

class MenuBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepositoy>(
      () => ProductRepositoyImpl(
        restClient: Get.find(),
      ),
    );
    Get.put(MenuController(productRepositoy: Get.find()));
  }
}
