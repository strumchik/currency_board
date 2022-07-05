import 'package:flutter/material.dart';

import '../presentation/global_menu.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: GlobalMenu(),
    );
  }
}


