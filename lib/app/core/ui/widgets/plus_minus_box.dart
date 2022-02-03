import 'package:flutter/material.dart';

import 'package:vakinha_burger/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_rounded_button.dart';

class PlusMinusBox extends StatelessWidget {
  final bool elevated;
  final Color? backgroundColor;
  final String? label;
  final int quantity;
  final double price;
  final VoidCallback minusCallBack;
  final VoidCallback plusCallBack;
  final bool calculateTotal;

  const PlusMinusBox({
    Key? key,
    this.elevated = false,
    this.backgroundColor,
    this.label,
    required this.quantity,
    required this.price,
    required this.minusCallBack,
    required this.plusCallBack,
    this.calculateTotal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevated ? 5 : 0,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.black26,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: label != null,
              child: Text(
                label ?? '',
                style: TextStyle(
                  fontSize: 15,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Row(
              children: [
                VakinhaRoundedButton(
                  onPressed: minusCallBack,
                  label: '-',
                ),
                Text('$quantity'),
                VakinhaRoundedButton(
                  onPressed: plusCallBack,
                  label: '+',
                ),
              ],
            ),
            Visibility(
              visible: label == null,
              child: Spacer(),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              constraints: BoxConstraints(minWidth: 70),
              child: Text(FormatterHelper.formatCurrency(
                  calculateTotal ? price * quantity : price)),
            ),
          ],
        ),
      ),
    );
  }
}
