import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/formatter_helper.dart';

import 'package:vakinha_burger/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger/app/models/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;

  const ProductTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(10),
        height: 80,
        child: Row(
          children: [
            Container(
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    'http://dartweek.academiadoflutter.com.br/images${product.image}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      product.name,
                      style: VakinhaUI.textBold,
                    ),
                    Text(
                      FormatterHelper.formatCurrency(product.price),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
