import 'dart:developer';

import 'package:vakinha_burger/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger/app/models/product_model.dart';

import './product_repositoy.dart';

class ProductRepositoyImpl implements ProductRepositoy {
  final RestClient _restClient;

  ProductRepositoyImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<ProductModel>> findAll() async {
    final result = await _restClient.get('/products/');
    if (result.hasError) {
      log(
        'Erro ao buscar produtos ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao buscar produtos');
    }
    return result.body
        .map<ProductModel>((p) => ProductModel.fromMap(p))
        .toList();
  }
}
