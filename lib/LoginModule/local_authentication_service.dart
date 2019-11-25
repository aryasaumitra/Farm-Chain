import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthenticationService {

    final _auth = LocalAuthentication();
    bool _isProtectionEnabled = false;

    // ignore: unnecessary_getters_setters
    bool get isProtectionEnabled => _isProtectionEnabled;

    // ignore: unnecessary_getters_setters
    set isProtectionEnabled(bool value) {
        _isProtectionEnabled = value;
    }

    bool isAuthenticated = false;

    Future<void> authenticate() async {
        if (_isProtectionEnabled) {
            try {
                isAuthenticated = await _auth.authenticateWithBiometrics(
                    localizedReason: 'Authenticate to Access',
                    useErrorDialogs: true,
                    stickyAuth: true,
                );
            } on PlatformException catch (e) {
                print(e);
            }
        }
    }
}