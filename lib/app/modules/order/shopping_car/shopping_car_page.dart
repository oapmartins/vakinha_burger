import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burger/app/core/ui/widgets/plus_minus_box.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_button.dart';
import 'package:validatorless/validatorless.dart';
import './shopping_car_controller.dart';

class ShoppingCarPage extends GetView<ShoppingCarController> {
  const ShoppingCarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constrains) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constrains.maxHeight,
              minWidth: constrains.maxWidth,
            ),
            child: IntrinsicHeight(
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            'Carrinho',
                            style: context.textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.theme.primaryColorDark,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: PlusMinusBox(
                            label: 'X salada',
                            elevated: true,
                            backgroundColor: Colors.white,
                            calculateTotal: true,
                            quantity: 1,
                            price: 10,
                            minusCallBack: () {},
                            plusCallBack: () {},
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total do pedido',
                                style: context.textTheme.bodyText1?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                FormatterHelper.formatCurrency(200),
                                style: context.textTheme.bodyText1?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        _AdressField(),
                        const Divider(),
                        _CpfField(),
                        const Divider(),
                        // const Spacer(),
                        Center(
                          child: SizedBox(
                            width: context.widthTransformer(reducedBy: 10),
                            child: VakinhaButton(
                              onpressed: () {},
                              label: 'FINALIZAR',
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CpfField extends GetView<ShoppingCarController> {
  const _CpfField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35,
            child: Text(
              'CPF',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {},
            validator: Validatorless.multiple([
              Validatorless.required('CPF Obrigatório'),
              Validatorless.cpf('CPF inválido'),
            ]),
            decoration: InputDecoration(
              hintText: 'Digite o CPF',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _AdressField extends StatelessWidget {
  const _AdressField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35,
            child: Text(
              'Endereço de entrega',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {},
            validator: Validatorless.required('Endereço Obrigatório'),
            decoration: InputDecoration(
              hintText: 'Digite o endereço',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
