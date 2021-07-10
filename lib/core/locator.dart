import 'package:passo_dashboard/core/services/cache_service.dart';

import '../core/services/navigator_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

class LocatorInjector {
  static Future<void> setupLocator() async {
    locator.registerLazySingleton(() => NavigatorService());
    locator.registerLazySingleton(() => CacheService());
  }
}
