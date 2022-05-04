import 'package:habit_list/model/loginUser/login_user.dart';
import 'package:habit_list/model/loginUser/repositoy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserNotifier extends StateNotifier<LoginUser?> {
  UserNotifier() : super(LoginUserRepository().getCurrentUser());

  Future<void> testSignIn() async {
    await LoginUserRepository().testSignIn();
    final currentUser = LoginUserRepository().getCurrentUser();
    state = currentUser;
  }

  Future<void> logout() async {
    await LoginUserRepository().logout();
    state = null;
  }

  Future<void> signInWithApple() async {
    await LoginUserRepository().signInWithApple();
    final currentUser = LoginUserRepository().getCurrentUser();
    state = currentUser;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, LoginUser?>((ref) {
  return UserNotifier();
});
