import 'package:flutter/material.dart';

import '../internal/default_text.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultText(text: 'Welcome to the\ncurrency application!');
  }
}


