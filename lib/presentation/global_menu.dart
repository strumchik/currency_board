import 'package:currency_board/presentation/second_screen.dart';
import 'package:currency_board/presentation/third_screen.dart';
import 'package:flutter/material.dart';

import 'first_screen.dart';

class GlobalMenu extends StatefulWidget {
  const GlobalMenu({Key? key}) : super(key: key);

  @override
  State<GlobalMenu> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<GlobalMenu> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp),
            label: 'Welcome',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange_sharp),
            label: 'Currency rate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp),
            label: 'Author',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow[800],
        onTap: _onItemTapped,
        backgroundColor: Colors.grey[500],
      ),
    );
  }
}

