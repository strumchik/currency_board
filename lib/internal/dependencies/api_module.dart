import 'package:currency_board/data/api/api_util.dart';
import 'package:currency_board/data/api/service/currency_service.dart';

class ApiModule {
  static final ApiUtil _apiUtil = ApiUtil(CurrencyService());

  static ApiUtil apiUtil() {
    return _apiUtil;
  }
}