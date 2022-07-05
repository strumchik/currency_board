import 'package:currency_board/data/api/api_util.dart';
import 'package:currency_board/domain/model/currency.dart';
import 'package:currency_board/domain/repository/currency_repository.dart';

class CurrencyDataRepository extends CurrencyRepository {
  final ApiUtil _apiUtil;

  CurrencyDataRepository(this._apiUtil);

  @override
  Future<Currency> getCurrency({required String base, required String target}) {
    return _apiUtil.getCurrency(fromCurrency: base, toCurrency: target);
  }

  
}