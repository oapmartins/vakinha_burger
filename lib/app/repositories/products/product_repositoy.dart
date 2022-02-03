import 'package:vakinha_burger/app/models/product_model.dart';

abstract class ProductRepositoy {
  Future<List<ProductModel>> findAll();
}
