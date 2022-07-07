import 'package:currency_board/data/api/request/get_currency_body.dart';
import 'package:dio/dio.dart';
import 'package:currency_board/data/api/model/api_currency.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CurrencyService {
  static const _baseUrl =
      'https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&';
  static String _apiKey = '';

  void getApiKey() async {
    await dotenv.load(fileName: "apikey.env");
    _apiKey = dotenv.get('CURRENCY_API');
  }

  Future<ApiCurrency> getCurrency(GetCurrencyBody body) async {
    String queryURL =
        "${_baseUrl}from_currency=${body.fromCurrency}&to_currency=${body.toCurrency}&apikey=$_apiKey";
    final Dio dio = Dio(BaseOptions(baseUrl: queryURL));
    final response = await dio.get('');
    return ApiCurrency.fromApi(response.data['Realtime Currency Exchange Rate']);
  }
}
