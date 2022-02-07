import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_button.dart';

class FinishedPage extends StatelessWidget {
  const FinishedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                Image.asset(
                  'assets/images/logo_rounded.png',
                  width: context.widthTransformer(reducedBy: 50),
                  height: context.heightTransformer(reducedBy: 70),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Pedido realizado com sucesso, clique no botão abaixo para acessar o QRCode do pix',
                    textAlign: TextAlign.center,
                    style: context.textTheme.subtitle1?.copyWith(
                      color: context.theme.primaryColorDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: context.widthTransformer(reducedBy: 30),
                  child: VakinhaButton(
                    label: 'PIX',
                    color: context.theme.primaryColorDark,
                    onpressed: () {},
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: context.widthTransformer(reducedBy: 10),
                  child: VakinhaButton(
                    label: 'FECHAR',
                    onpressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
