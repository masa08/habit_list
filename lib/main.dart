import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habit_list/app.dart';
import 'package:habit_list/infra/auth/firebase_repository.dart';
import 'package:habit_list/infra/habit/firebase_repository.dart';
import 'package:habit_list/model/auth/auth.dart';
import 'package:habit_list/model/habit/habit.dart';
import 'package:habit_list/view_model/auth.dart';
import 'package:habit_list/view_model/habit.dart';
import 'package:habit_list/view_model/timeline_habit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_options.dart';

// dependency injection
final authRepositoryProvider = Provider.autoDispose(
  (ref) => FirebaseAuthRepository(),
);
final habitRepositoryProvider = Provider.autoDispose(
  (ref) => FirebaseHabitRepository(),
);

final authProvider = StateNotifierProvider<AuthNotifier, Auth?>((ref) {
  return AuthNotifier(ref.read(authRepositoryProvider));
});
final habitsProvider =
    StateNotifierProvider.autoDispose<HabitsNotifier, List<Habit>>((ref) {
  return HabitsNotifier(ref.read(habitRepositoryProvider));
});
final timelineHabitsProvider =
    StateNotifierProvider.autoDispose<TimeLineHabitsNotifier, List<Habit>>(
        (ref) {
  return TimeLineHabitsNotifier(ref.read(habitRepositoryProvider));
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // run
  runApp(const ProviderScope(child: App()));
}
