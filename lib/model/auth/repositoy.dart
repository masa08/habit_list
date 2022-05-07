import 'package:habit_list/model/habit/habit.dart';
import 'package:habit_list/model/auth/auth.dart';

abstract class AuthRepositoryInterface {
  Auth? getCurrentUser();

  Future<void> testSignIn();

  Future<void> logout();

  Future<void> signInWithApple();

  Future<void> signInWithGoogle();
}
