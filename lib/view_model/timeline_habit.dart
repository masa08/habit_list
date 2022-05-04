import 'package:habit_list/model/habit/habit.dart';
import 'package:habit_list/model/habit/repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 自分のhabitを管理する責務
class TimeLineHabitsNotifier extends StateNotifier<List<Habit>> {
  TimeLineHabitsNotifier() : super([]);

  Future<void> initHabit() async {
    final habits = await HabitRepository().initTimeLine();
    state = habits;
  }
}

final timelineHabitsProvider =
    StateNotifierProvider<TimeLineHabitsNotifier, List<Habit>>((ref) {
  return TimeLineHabitsNotifier();
});
