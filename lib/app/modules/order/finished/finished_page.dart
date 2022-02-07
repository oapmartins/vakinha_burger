import 'package:flutter/material.dart';

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
                Image.asset('assets/images/logo_rounded.png'),
                const SizedBox(height: 10),
                const Text(
                  'Pedido realizado com sucesso, clique no botão abaixo para acessar o QRCode do pix',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
