// ignore: import_of_legacy_library_into_null_safe
class BaseService {
  BaseService({String? title}) {
    print(
      title ?? this.runtimeType.toString(),
    );
  }
}
