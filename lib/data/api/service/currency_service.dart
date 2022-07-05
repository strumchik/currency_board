import 'package:currency_board/data/api/request/get_currency_body.dart';
import 'package:dio/dio.dart';
import 'package:currency_board/data/api/model/api_currency.dart';

class CurrencyService {
  static const _BASE_URL =
      'https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&';
  //'from_currency=*BASE*&to_currency=*RESULT*&apikey=demo';
  static const _api_key = 'ZSFPJCOD9YWZJ4MC';

  Future<ApiCurrency> getCurrency(GetCurrencyBody body) async {
    String queryURL =
        "${_BASE_URL}from_currency=${body.fromCurrency}&to_currency=${body.toCurrency}&apikey=$_api_key";
    final Dio dio = Dio(BaseOptions(baseUrl: queryURL));
    final response = await dio.get('');
    return ApiCurrency.fromApi(response.data['Realtime Currency Exchange Rate']);
  }
}
