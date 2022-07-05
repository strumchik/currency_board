import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  const DefaultText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final TextStyle optionStyle =
  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: optionStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}