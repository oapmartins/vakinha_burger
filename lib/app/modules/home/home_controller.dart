import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/services/auth_service.dart';
import 'package:vakinha_burger/app/core/services/shopping_car_service.dart';
import 'package:vakinha_burger/app/modules/menu/menu_bindings.dart';
import 'package:vakinha_burger/app/modules/menu/menu_page.dart';
import 'package:vakinha_burger/app/modules/order/shopping_car/shopping_car_bindings.dart';
import 'package:vakinha_burger/app/modules/order/shopping_car/shopping_car_page.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;
  final ShoppingCarService _shoppingCarService;

  final _tabIndex = 0.obs;
  final _tabs = ['/menu', '/order/shopping_card', '/exit'];

  HomeController({
    required ShoppingCarService shoppingCarService,
  }) : _shoppingCarService = shoppingCarService;

  int get tabIndex => _tabIndex.value;

  int get totalProductsInShoppingCar => _shoppingCarService.totalProducts;

  set tabIndex(int index) {
    _tabIndex(index);
    if (_tabs[index] == '/exit') {
      Get.find<AuthService>().logout();
    } else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGeneratedRouter(RouteSettings settings) {
    if (settings.name == '/menu') {
      return GetPageRoute(
        settings: settings,
        page: () => const MenuPage(),
        binding: MenuBindings(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/order/shopping_card') {
      return GetPageRoute(
        settings: settings,
        page: () => const ShoppingCarPage(),
        binding: ShoppingCarBindings(),
        transition: Transition.fadeIn,
      );
    }
  }
}
