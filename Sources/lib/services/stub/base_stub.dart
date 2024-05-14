import 'package:get_it/get_it.dart';
import 'package:test_flutter_vue/services/stub/data_stub.dart';

abstract class BaseStub {
  final GetIt _getIt = GetIt.instance;

  DataStub stub() => _getIt.get<DataStub>();
}
