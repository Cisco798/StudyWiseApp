import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();

  User? get currentUser => _authService.currentUser;

  Future<void> login(String email, String password) async {
    await _authService.login(email, password);
    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    await _authService.signUp(email, password);
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.logout();
    notifyListeners();
  }
}
