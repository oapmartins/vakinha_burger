import 'package:get/get.dart';
import 'package:vakinha_burger/app/models/product_model.dart';
import 'package:vakinha_burger/app/models/shopping_car_model.dart';

class ShoppingCarService extends GetxService {
  final _shoppingCard = <int, ShoppingCarModel>{}.obs;
  List<ShoppingCarModel> get products => _shoppingCard.values.toList();

  int get totalProducts => _shoppingCard.values.length;

  ShoppingCarModel? getById(int id) => _shoppingCard[id];

  void addAndRemoveProductInShoppingCard(
    ProductModel product, {
    required int quantity,
  }) {
    if (quantity == 0) {
      _shoppingCard.remove(product.id);
    } else {
      _shoppingCard.update(product.id, (product) {
        product.quantity = quantity;
        return product;
      }, ifAbsent: () {
        return ShoppingCarModel(quantity: quantity, product: product);
      });
    }
  }
}
