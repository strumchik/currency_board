import '../model/currency.dart';

abstract class CurrencyRepository {
  Future<Currency> getCurrency({
  required String base,
    required String target,
});
}