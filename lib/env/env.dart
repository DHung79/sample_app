enum Environment { prod, dev, stg }

abstract class AppEnvironment {
  static late String baseUrl;
  static late String baseSocketUrl;
  static late String title;
  static late Environment _env;
  static Environment get env => _env;
  static setupEnv(Environment e) {
    _env = e;
    switch (e) {
      case Environment.dev:
        {
          baseUrl = 'dev.baseUrl';
          baseSocketUrl = 'dev.baseSocketUrl';
          title = 'dev';
          break;
        }
      case Environment.stg:
        {
          baseUrl = 'stg.baseUrl';
          baseSocketUrl = 'stg.baseSocketUrl';
          title = 'stg';
          break;
        }
      case Environment.prod:
        {
          baseUrl = 'prod.baseUrl';
          baseSocketUrl = 'prod.baseSocketUrl';
          title = 'prod';
          break;
        }
    }
  }
}
