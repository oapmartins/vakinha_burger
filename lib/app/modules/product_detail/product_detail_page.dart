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
                          'http://dartweek.academiadoflutter.com.br/images${controller.product.image}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      controller.product.name,
                      style: context.textTheme.headline4!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      controller.product.description,
                      style: context.textTheme.bodyText2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () {
                      return PlusMinusBox(
                        plusCallBack: () => controller.addProduct(),
                        minusCallBack: () => controller.removeProduct(),
                        price: controller.product.price,
                        quantity: controller.quantity,
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: Text(
                      'Total',
                      style: VakinhaUI.textBold,
                    ),
                    trailing: Obx(() {
                      return Text(
                        FormatterHelper.formatCurrency(controller.totalPrice),
                        style: VakinhaUI.textBold,
                      );
                    }),
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
