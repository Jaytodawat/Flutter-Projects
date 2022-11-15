import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const Color cardsColor = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Expanded(
                  child: ReusableCard(
                    cardsColor,
                    cardChild: IconContent(FontAwesomeIcons.mars, 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardsColor,
                    cardChild: IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ReusableCard(cardsColor),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Expanded(
                  child: ReusableCard(cardsColor),
                ),
                Expanded(
                  child: ReusableCard(cardsColor),
                ),
              ],
            ),
          ),
          Container(
            color: const Color(0xFFEB1555),
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}

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
          size: 60,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 15.0,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}

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

//final vs const
//1. Both final and const variables once assigned can't reassigned.
//2.But const variable can't be assigned at run time but final can.
//3.const variables can't be accessed at run time but final can.
