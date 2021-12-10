import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:injectable/injectable.dart';

import '../../injection.dart';
import 'facebook_events.dart';

@LazySingleton(
    as: IFacebookEventLogger, env: [Environments.dev, Environments.prod, Environments.prodReplica])
class FacebookEventLogger extends IFacebookEventLogger {
  final FacebookAppEvents _facebookAppEvents = FacebookAppEvents();

  FacebookEventLogger() {
    print('From col');
  }

  Future logEvent(String eventName, Map parameters) async {
    print('------------------------');
    print('Sdk facebook log event: $eventName');
    print('------------------------');
    if (parameters.isNotEmpty) {
      var map = Map<String, String>.from(parameters);
      await _facebookAppEvents.logEvent(name: eventName, parameters: map);

    } else
      await _facebookAppEvents.logEvent(name: eventName);
  }

  @override
  Future singIn() async {
    await this.logEvent(FacebookEvents.INGRESAR, {});
  }
}

class FacebookEventLogger2 extends IFacebookEventLogger {
  noSuchMethod(Invocation invocation) {
    print('Tried to call Facebook Event Logger on dev');
    print(invocation.memberName.toString());
  }
}

@LazySingleton(
    as: IFacebookEventLogger,
    env: [Environments.devMx, Environments.prodMx, Environments.testMx])
class FacebookEventLoggerDeact extends IFacebookEventLogger {
  FacebookEventLoggerDeact() {
    print("----------------------------------");
    print("Facebook Event Logger: Deactivated");
    print("----------------------------------");
  }

  @override
  Future singIn() {
    return Future.delayed(Duration(milliseconds: 1));
  }
}

///interface con los metodos para facebook
abstract class IFacebookEventLogger {
  //Event 1
  Future singIn();
}
