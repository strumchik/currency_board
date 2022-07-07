import 'package:currency_board/data/api/request/get_currency_body.dart';
import 'package:currency_board/data/api/service/currency_service.dart';
import 'package:currency_board/data/mapper/currency_mapper.dart';
import 'package:currency_board/domain/model/currency.dart';

class ApiUtil {
  final CurrencyService _currencyService;

  ApiUtil(this._currencyService) {
    _currencyService.getApiKey();
  }

  Future<Currency> getCurrency({
    required String fromCurrency,
    required String toCurrency,
  }) async {
    final body =
        GetCurrencyBody(fromCurrency: fromCurrency, toCurrency: toCurrency);
    final result = await _currencyService.getCurrency(body);
    return CurrencyMapper.fromApi(result);
  }
}
