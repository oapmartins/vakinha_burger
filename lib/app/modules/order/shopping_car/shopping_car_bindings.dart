import 'package:get/get.dart';
import './shopping_car_controller.dart';

class ShoppingCarBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ShoppingCarController());
    }
}