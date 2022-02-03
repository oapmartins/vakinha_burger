import 'dart:developer';

import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger/app/models/product_model.dart';
import 'package:vakinha_burger/app/repositories/products/product_repositoy.dart';

class MenuController extends GetxController with LoaderMixin, MessagesMixin {
  final ProductRepositoy _productRepositoy;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final menu = <ProductModel>[].obs;

  MenuController({
    required ProductRepositoy productRepositoy,
  }) : _productRepositoy = productRepositoy;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      _loading.toggle();
      await findAllProducts();
      _loading.toggle();
    } on Exception catch (e, s) {
      _loading.toggle();
      log('Erro ao buscar Produtos', error: e, stackTrace: s);
      _message(
        MessageModel(
            title: 'Erro',
            message: 'Erro ao buscar Menu',
            type: MessageType.error),
      );
    }
  }

  Future<void> findAllProducts() async {
    final products = await _productRepositoy.findAll();
    menu.assignAll(products);
  }

  Future<void> refreshPage() async {
    try {
      await findAllProducts();
    } on Exception catch (e, s) {
      log('Erro ao buscar Produtos', error: e, stackTrace: s);
      _message(
        MessageModel(
            title: 'Erro',
            message: 'Erro ao buscar Menu',
            type: MessageType.error),
      );
    }
  }
}
