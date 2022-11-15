import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(this.colour, {super.key, this.cardChild});

  final Color
      colour; //final keyword added to make colour immutable i.e it can not be changed once assigned.

  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChild,
    );
  }
}
