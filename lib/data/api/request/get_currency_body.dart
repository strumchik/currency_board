class GetCurrencyBody {
  final String fromCurrency;
  final String toCurrency;

  GetCurrencyBody({
    required this.fromCurrency,
    required this.toCurrency,
  });

  Map<String, dynamic> toApi() {
    return {
      'from': fromCurrency,
      'to': toCurrency,
      'formatted': 0,
    };
  }
}
