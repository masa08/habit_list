import 'package:flutter/material.dart';
import 'package:habit_list/conponents/habit_list.dart';
import 'package:habit_list/domain/habit.dart';
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

final sampleHabitList = [
  Habit("(timeline)筋トレを継続的に行う", "活力に満ちた自分", "圧倒的強さ", "AM 07:00", true),
  Habit("(timeline)筋トレを継続的に行う", "活力に満ちた自分", "圧倒的強さ", "AM 07:00", true),
  Habit("(timeline)筋トレを継続的に行う", "活力に満ちた自分", "圧倒的強さ", "AM 07:00", true),
];

class _Body extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HabitList(habits: sampleHabitList);
  }
}
