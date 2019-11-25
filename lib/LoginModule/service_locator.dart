import 'package:agro_chain/LoginModule/local_authentication_service.dart';

import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
    locator.registerLazySingleton(() => LocalAuthenticationService());
}