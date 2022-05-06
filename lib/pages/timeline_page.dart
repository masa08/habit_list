import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_list/conponents/habit_list.dart';
import 'package:habit_list/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimeLinePage extends StatelessWidget {
  const TimeLinePage({Key? key}) : super(key: key);

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
    final habitModel = ref.read(timelineHabitsProvider.notifier);
    final habits = ref.watch(timelineHabitsProvider);

    useEffect(() {
      habitModel.initHabit();
      return null;
    }, []);

    return HabitList(habits: habits);
  }
}
