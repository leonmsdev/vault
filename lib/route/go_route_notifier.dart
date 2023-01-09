import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vault/features/auth/services/auth_service.dart';

final goRouterNotifierProvider = Provider<GoRouterNotifier>((ref) {
  return GoRouterNotifier();
});

class GoRouterNotifier extends ChangeNotifier {
  bool _isSingedIn =
      AuthService.firebase().currentUser.toString() == 'null' ? false : true;
  bool get isSignedIn => _isSingedIn;

  set isSignedIn(bool value) {
    _isSingedIn = value;
    notifyListeners();
  }

  bool _goToRegisterScreen = false;
  bool get goToRegisterScreen => _goToRegisterScreen;
  set goToRegisterScreen(bool value) {
    _goToRegisterScreen = value;
    notifyListeners();
  }

  bool _validMasterKey = false;
  bool get validMasterKey => _validMasterKey;
  set validMasterKey(bool value) {
    _validMasterKey = value;
    notifyListeners();
  }
}
