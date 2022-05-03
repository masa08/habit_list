import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_list/foundation/constants/route.dart';
import 'package:habit_list/pages/add_habit_page.dart';
import 'package:habit_list/pages/main_page.dart';
import 'package:habit_list/pages/sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = Provider((ref) {
  final user = FirebaseAuth.instance.currentUser;

  return GoRouter(
    initialLocation: user != null ? RoutePath.home : RoutePath.singIn,
    routes: [
      GoRoute(
        path: RoutePath.home,
        builder: (context, state) => const MainPage(),
        routes: [
          GoRoute(
            name: RouteName.add,
            path: RouteName.add,
            builder: (context, state) => const AddHabitPage(),
          ),
          GoRoute(
            name: RouteName.singIn,
            path: RouteName.singIn,
            builder: (context, state) => const SignInPage(),
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    ),
  );
});
