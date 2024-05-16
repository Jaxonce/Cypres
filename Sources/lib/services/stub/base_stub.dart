import 'package:cypres/services/stub/data_stub.dart';
import 'package:get_it/get_it.dart';

final GetIt _getIt = GetIt.instance;

abstract class BaseStub {
  DataStub stub() => _getIt.get<DataStub>();
}
