import 'package:currency_board/data/api/model/api_currency.dart';
import 'package:currency_board/domain/model/currency.dart';

class CurrencyMapper {
  static Currency fromApi(ApiCurrency apiCurrency) {
    return Currency(
        base: apiCurrency.base,
        baseName: apiCurrency.baseName,
        rates: apiCurrency.rates,
        target: apiCurrency.target,
        targetName: apiCurrency.targetName
    );
  }
}