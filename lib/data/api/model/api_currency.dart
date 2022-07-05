import 'dart:core';

class ApiCurrency {
  final String base;
  final String baseName;
  final double rates;
  final String target;
  final String targetName;

  ApiCurrency.fromApi(Map<String, dynamic> map)
      : base = map['1. From_Currency Code'],
        baseName = map['2. From_Currency Name'],
        rates = double.parse(map['5. Exchange Rate']),
        target = map['3. To_Currency Code'],
        targetName = map['4. To_Currency Name']
  ;
}
