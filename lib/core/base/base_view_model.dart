import 'package:flutter/foundation.dart';
import 'package:passo_dashboard/core/locator.dart';
import 'package:passo_dashboard/core/services/navigator_service.dart';

class BaseViewModel extends ChangeNotifier {
  String? _title;
  bool _busy;
  bool _isDisposed = false;

  BaseViewModel({
    bool busy = false,
    String? title,
  })  : _busy = busy,
      _title = title {
    print(title ?? this.runtimeType.toString());
  }

  bool get busy => this._busy;
  bool get isDisposed => this._isDisposed;
  final NavigatorService navigatorService = locator<NavigatorService>();

  set busy(bool busy) {
    this._busy = busy;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!isDisposed) {
        super.notifyListeners();
    } else {
        print('notifyListeners: Notify listeners called after '
            '${_title ?? this.runtimeType.toString()} has been disposed');
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
