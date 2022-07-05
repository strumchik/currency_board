import 'dart:core';

class Currency {
  late final String base;
  late final String baseName;
  late final double rates;
  late final String target;
  late final String targetName;

  Currency({
    required this.base,
    required this.baseName,
    required this.rates,
    required this.target,
    required this.targetName,
});

/*
  Map<String, String> data =  {
  "1. From_Currency Code": "USD",
  "2. From_Currency Name": "United States Dollar",
  "3. To_Currency Code": "JPY",
  "4. To_Currency Name": "Japanese Yen",
  "5. Exchange Rate": "135.17500000",
  "6. Last Refreshed": "2022-07-02 07:54:43",
  "7. Time Zone": "UTC",
  "8. Bid Price": "135.17500000",
  "9. Ask Price": "135.17500000"
  };
 */
}