import 'package:currency_board/internal/default_text.dart';
import 'package:currency_board/internal/dependencies/repository_module.dart';
import 'package:flutter/material.dart';

import '../domain/model/currency.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SecondScreen> createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  String currencyBase = 'USD';
  List<String> currencyTarget = ['RUB', 'EUR', 'JPY'];
  Future<Currency> _getCurrency(index) async {
    return RepositoryModule.currencyRepository()
        .getCurrency(base: currencyBase, target: currencyTarget[index]);
  }

  bool isNeededUpdate = false;
  String lastUpdateTime = '';
  late Map<String, double> currencies = {};
  // List<double> rates = [0, 0, 0];

  @override
  void initState() {
    _getThingsOnStartup();
    super.initState();
  }

  Future _getThingsOnStartup() async {
    for (int i = 0; i < currencyTarget.length; i++) {
      for (String string in currencyTarget) {
        currencies.putIfAbsent(string, () => 0);
      }
      final rate = await _getCurrency(i);
      currencies.update(rate.target, (value) => rate.rates,
          ifAbsent: () => rate.rates);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const DefaultText(text: 'USD exchange rates:'),
        FutureBuilder<Currency>(
            // future: _getCurrency(0),
            builder: (context, snapshot) {
              String target = currencies.keys.elementAt(0);
              if (snapshot.hasData && snapshot.data.runtimeType == Currency) {
                Currency localData = snapshot.data as Currency;
                double? newRate = localData.rates;
                currencies[target] = newRate;
                return DefaultText(
                    text:
                        "${currencies[target].toString()} ${localData.target}");
              } else if (!currencies.containsValue(0)) {
                return DefaultText(
                    text:
                        "${currencies[target].toString()} ${currencies.keys.elementAt(0)}");
              } else {
                return const CircularProgressIndicator();
              }
            }),
        FutureBuilder<Currency>(
            // future: _getCurrency(1),
            builder: (context, snapshot) {
              String target = currencies.keys.elementAt(1);
              if (snapshot.hasData && snapshot.data.runtimeType == Currency) {
                Currency localData = snapshot.data as Currency;
                double? newRate = localData.rates;
                currencies[target] = newRate;
                return DefaultText(
                    text:
                        "${currencies[target].toString()} ${localData.target}");
              } else if (!currencies.containsValue(1)) {
                return DefaultText(
                    text:
                        "${currencies[target].toString()} ${currencies.keys.elementAt(1)}");
              } else {
                return const CircularProgressIndicator();
              }
            }),
            FutureBuilder<Currency>(
            // future: _getCurrency(2),
            builder: (context, snapshot) {
              String target = currencies.keys.elementAt(2);
              if (snapshot.hasData && snapshot.data.runtimeType == Currency) {
                Currency localData = snapshot.data as Currency;
                double? newRate = localData.rates;
                currencies[target] = newRate;
                return DefaultText(
                    text:
                        "${currencies[target].toString()} ${localData.target}");
              } else if (!currencies.containsValue(2)) {
                return DefaultText(
                    text:
                        "${currencies[target].toString()} ${currencies.keys.elementAt(2)}");
              } else {
                return const CircularProgressIndicator();
              }
            }),
        TextButton(
          onPressed: () {
            setState(() {
              isNeededUpdate = true;
            });
          },
          child: const DefaultText(text: 'Manual update'),
        ),
      ],
    );
  }
}
