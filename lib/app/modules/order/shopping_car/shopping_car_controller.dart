import 'package:get/get.dart';

import 'package:vakinha_burger/app/core/services/auth_service.dart';
import 'package:vakinha_burger/app/core/services/shopping_car_service.dart';
import 'package:vakinha_burger/app/models/shopping_car_model.dart';

class ShoppingCarController extends GetxController {
  final AuthService _authService;
  final ShoppingCarService _shoppingCarService;

  ShoppingCarController({
    required AuthService authService,
    required ShoppingCarService shoppingCarService,
  })  : _authService = authService,
        _shoppingCarService = shoppingCarService;

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
}
