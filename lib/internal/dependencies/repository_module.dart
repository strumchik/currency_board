import 'package:currency_board/domain/repository/currency_data_repository.dart';
import 'package:currency_board/domain/repository/currency_repository.dart';
import 'package:currency_board/internal/dependencies/api_module.dart';

class RepositoryModule {
  static final CurrencyRepository _currencyRepository = CurrencyDataRepository(
  ApiModule.apiUtil());

  static CurrencyRepository currencyRepository() {
    return _currencyRepository;
  }
}
