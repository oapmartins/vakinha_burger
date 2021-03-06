import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/services/shopping_car_service.dart';
import 'package:vakinha_burger/app/models/product_model.dart';

class ProductDetailController extends GetxController {
  final _product = Rx<ProductModel>(Get.arguments);
  final _totalPrice = 0.00.obs;
  final _quantity = 1.obs;
  final ShoppingCarService _shoppingCarService;
  final _alReadyAdded = false.obs;

  ProductDetailController({
    required ShoppingCarService shoppingCarService,
  }) : _shoppingCarService = shoppingCarService;

  ProductModel get product => _product.value;
  double get totalPrice => _totalPrice.value;
  int get quantity => _quantity.value;
  bool get alReadyAdded => _alReadyAdded.value;

  @override
  void onInit() {
    super.onInit();
    _totalPrice(product.price);

    ever<int>(_quantity, (quantity) {
      _totalPrice(product.price * quantity);
    });

    final productShoppingCar = _shoppingCarService.getById(product.id);
    if (productShoppingCar != null) {
      _quantity(productShoppingCar.quantity);
      _alReadyAdded(true);
    }
  }

  void addProduct() {
    _quantity.value += 1;
  }

  void removeProduct() {
    if (_quantity > 1) {
      _quantity.value -= 1;
    }
  }

  void addProductInShoppinCar() {
    _shoppingCarService.addAndRemoveProductInShoppingCard(
      product,
      quantity: quantity,
    );
    Get.back();
  }
}
