import 'package:google_fonts/google_fonts.dart';
import 'package:passo_dashboard/constants.dart';
import 'package:passo_dashboard/core/locator.dart';
import 'package:passo_dashboard/core/providers.dart';
import 'package:passo_dashboard/core/services/cache_service.dart';
import 'package:passo_dashboard/core/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocatorInjector.setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  locator<NavigatorService>().createRoutes();
  locator<CacheService>().initValues();
  runApp(MainApplication());
}

class MainApplication extends StatelessWidget with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderInjector.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: [
          Locale('en', ''),
        ],
        title: 'PAssO Dashboard',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        navigatorKey: locator<NavigatorService>().navigatorKey,
        onGenerateRoute: locator<NavigatorService>().generator,
        initialRoute: '/',
      ),
    );
  }
}
