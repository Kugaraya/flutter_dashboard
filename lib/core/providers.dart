import 'package:passo_dashboard/core/controllers/MenuController.dart';
import 'package:provider/single_child_widget.dart';

import '../core/locator.dart';
import '../core/services/navigator_service.dart';
import 'package:provider/provider.dart';

class ProviderInjector {
  static List<SingleChildWidget> providers = [
    ..._independentServices,
    ..._dependentServices,
    ..._consumableServices,
  ];

  static List<SingleChildWidget> _independentServices = [
    Provider.value(value: locator<NavigatorService>()),
  ];

  static List<SingleChildWidget> _dependentServices = [
    ChangeNotifierProvider<MenuController>(
      create: (_) => MenuController(),
    ),
  ];
  
  static List<SingleChildWidget> _consumableServices = [
    
  ];
}
