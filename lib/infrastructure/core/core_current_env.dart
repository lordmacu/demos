import 'package:ualet/injection.dart';
import 'package:injectable/injectable.dart';

abstract class IEnv {
  bool isColombia();
}

@Singleton(as: IEnv, env: [Environments.dev, Environments.prod, Environments.test, Environments.prodReplica])
class EnvCol extends IEnv {
  @override
  bool isColombia() {
    return true;
  }
}

@Singleton(
    as: IEnv,
    env: [Environments.devMx, Environments.prodMx, Environments.testMx])
class EnvMx extends IEnv {
  @override
  bool isColombia() {
    return false;
  }
}
