import 'package:habit_list/model/auth/auth.dart';
import 'package:habit_list/model/auth/repositoy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthNotifier extends StateNotifier<Auth?> {
  AuthNotifier(this._repository) : super(null);
  final AuthRepositoryInterface _repository;

  Future<void> testSignIn() async {
    await _repository.testSignIn();
    final currentUser = _repository.getCurrentUser();
    state = currentUser;
  }

  Future<void> logout() async {
    await _repository.logout();
    state = null;
  }

  Future<void> signInWithApple() async {
    await _repository.signInWithApple();
    final currentUser = _repository.getCurrentUser();
    state = currentUser;
  }
}
