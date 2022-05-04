import 'package:flutter/material.dart';
import 'package:habit_list/conponents/habit_list.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_list/view_model/habit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
    final habitModel = ref.read(habitsProvider.notifier);
    final habits = ref.watch(habitsProvider);

    useEffect(() {
      habitModel.initHabit();
    }, []);

    return HabitList(habits: habits);
  }
}
