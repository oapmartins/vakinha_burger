
import 'package:flutter/material.dart';

class VakinhaRoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final double fontSize;

  const VakinhaRoundedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.fontSize = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label, style: TextStyle(color: Colors.grey, fontSize: fontSize),),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        primary: Colors.white,
      ),
    );
  }
}
