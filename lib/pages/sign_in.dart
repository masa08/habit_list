import 'package:flutter/material.dart';
import 'package:habit_list/foundation/constants/route.dart';
import 'package:habit_list/hooks/use_router.dart';
import 'package:habit_list/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final userModel = ref.read(authProvider.notifier);

    onPress() async {
      await userModel.testSignIn();
      router.go(RoutePath.home);
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SignInWithAppleButton(onPressed: onPress),
        ),
      ),
    );
  }
}
