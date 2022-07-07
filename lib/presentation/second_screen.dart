import 'package:currency_board/internal/default_text.dart';
import 'package:currency_board/internal/dependencies/repository_module.dart';
import 'package:flutter/material.dart';
import '../domain/model/currency.dart';
import 'package:flutter_countdown_timer/index.dart';

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
  String lastUpdateTime = ' ';
  Map<String, double> currencies = {};
  CountdownController? countdownController;
  bool isRunning = false;
  int timerValue = 60;

  Future<Currency> _getCurrency(index) async {
    return RepositoryModule.currencyRepository()
        .getCurrency(base: currencyBase, target: currencyTarget[index]);
  }

  String _prettyTime(DateTime dt) {
    String hours = dt.hour.toString();
    String minutes = dt.minute.toString().padLeft(2, '0');
    String seconds = dt.second.toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  void _startTimer() {
    countdownController = CountdownController(
        duration: Duration(seconds: timerValue),
        onEnd: () {
          _recalculateRates().whenComplete(() {
            setState(() {
              lastUpdateTime = _prettyTime(DateTime.now());
            });
            if (isRunning) _startTimer();
          });
        });
    countdownController?.start();
  }

  @override
  void initState() {
    isRunning = true;
    _recalculateRates().whenComplete(() {
      _startTimer();
      setState(() {
        lastUpdateTime = _prettyTime(DateTime.now());
      });
    });
    super.initState();
  }

  Future _recalculateRates() async {
    for (int i = 0; i < currencyTarget.length; i++) {
      for (String string in currencyTarget) {
        currencies.putIfAbsent(string, () => 0);
      }
      final rate = await _getCurrency(i);
      currencies.update(rate.target, (value) => rate.rates,
          ifAbsent: () => rate.rates);
    }
  }

  Widget _rateShowWidget(index) {
    String target = currencies.keys.elementAt(index);
    if (!currencies.containsValue(0)) {
      return DefaultText(
          text:
              "${currencies[target].toString()} ${currencies.keys.elementAt(index)}");
    } else if (index !=0 && currencies.values.every((element) => element == 0.0)) {
      return const Text("");
    } else {
      return const CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const DefaultText(text: 'USD exchange rates:'),
        _rateShowWidget(0),
        _rateShowWidget(1),
        _rateShowWidget(2),
        DefaultText(text: 'updated: $lastUpdateTime'),
      ],
    );
  }
}
