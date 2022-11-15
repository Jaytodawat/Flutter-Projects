import 'package:flutter/material.dart';

const textStyle = TextStyle(
  fontSize: 15.0,
  color: Color(0xFF8D8E98),
);

const iconsSize = 60.0;

class IconContent extends StatelessWidget {
  const IconContent(this.icon, this.text, {super.key});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconsSize,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: textStyle,
        )
      ],
    );
  }
}
