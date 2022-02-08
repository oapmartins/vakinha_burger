import 'package:get/get.dart';

import 'package:vakinha_burger/app/core/services/auth_service.dart';
import 'package:vakinha_burger/app/core/services/shopping_car_service.dart';
import 'package:vakinha_burger/app/models/order.dart';
import 'package:vakinha_burger/app/models/shopping_car_model.dart';
import 'package:vakinha_burger/app/modules/home/home_controller.dart';
import 'package:vakinha_burger/app/repositories/order/order_repository.dart';

class ShoppingCarController extends GetxController {
  final AuthService _authService;
  final ShoppingCarService _shoppingCarService;
  final OrderRepository _orderRepository;

  ShoppingCarController({
    required AuthService authService,
    required ShoppingCarService shoppingCarService,
    required OrderRepository orderRepository,
  })  : _authService = authService,
        _shoppingCarService = shoppingCarService,
        _orderRepository = orderRepository;

  final _address = ''.obs;
  final _cpf = ''.obs;

  List<ShoppingCarModel> get products => _shoppingCarService.products;

  double get totalValue => _shoppingCarService.totalValue;

  set address(String address) => _address.value = address;

  set cpf(String cpf) => _cpf.value = cpf;

  void addQuantityInProduct(ShoppingCarModel shoppingCarModel) {
    _shoppingCarService.addAndRemoveProductInShoppingCard(
      shoppingCarModel.product,
      quantity: shoppingCarModel.quantity + 1,
    );
  }

  void subtractQuantityInProduct(ShoppingCarModel shoppingCarModel) {
    _shoppingCarService.addAndRemoveProductInShoppingCard(
      shoppingCarModel.product,
      quantity: shoppingCarModel.quantity - 1,
    );
  }

  void clear() => _shoppingCarService.clear();

  Future<void> createOrder() async {
    final userId = _authService.getUserId();
    final order = Order(
      userId: userId!,
      cpf: _cpf.value,
      address: _address.value,
      items: products,
    );

    var orderPix = await _orderRepository.createOrder(order);
    orderPix = orderPix.copyWith(totalValue: totalValue);
    clear();
    Get.offAllNamed('/orders/finished', arguments: orderPix);
    Get.back(id: HomeController.NAVIGATOR_KEY);
  }
}
