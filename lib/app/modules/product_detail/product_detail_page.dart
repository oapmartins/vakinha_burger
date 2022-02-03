import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burger/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger/app/core/ui/widgets/plus_minus_box.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_button.dart';
import './product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.minWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: context.width,
                    height: context.heightTransformer(reducedBy: 60),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'http://conteudo.imguol.com.br/c/entretenimento/8c/2018/04/18/fast-food-lanche-1524056858988_v2_1183x887.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'X Tudo',
                      style: context.textTheme.headline4!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'X Tudo',
                      style: context.textTheme.bodyText2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  PlusMinusBox(
                    minusCallBack: () {},
                    plusCallBack: () {},
                    price: 6.00,
                    quantity: 1,
                    label: 'X TUDAO',
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(
                      'Total',
                      style: VakinhaUI.textBold,
                    ),
                    trailing: Text(
                      FormatterHelper.formatCurrency(200),
                      style: VakinhaUI.textBold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: context.widthTransformer(reducedBy: 10),
                      child:
                          VakinhaButton(onpressed: () {}, label: 'ADICIONAR'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
