import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection(String env) async {
  await $initGetIt(getIt, environment: env);
}

class Environments {
  final String name;

  const Environments(this.name);

  static const dev = 'dev';
  static const prod = 'prod';
  static const prodReplica = 'prodReplica';
  static const test = 'test';

  static const devMx = 'dev_mx';
  static const prodMx = 'prod_mx';
  static const testMx = 'test_mx';
}