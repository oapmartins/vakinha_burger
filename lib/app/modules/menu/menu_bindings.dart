import 'package:get/get.dart';
import './menu_controller.dart';

class MenuBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(MenuController());
    }
}