import 'package:habit_list/model/habit/habit.dart';
import 'package:habit_list/model/habit/repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HabitsNotifier extends StateNotifier<List<Habit>> {
  HabitsNotifier() : super([]);

  Future<void> initHabit() async {
    // await HabitRepository().init();
  }

  Future<void> addHabit(
      {required String title,
      required String shortTermGoal,
      required String longTermGoal,
      required String routineDate}) async {
    final habit = Habit(title, shortTermGoal, longTermGoal, routineDate);
    await HabitRepository().add(habit);
    state = [...state, habit];
  }
}

final habitsProvider =
    StateNotifierProvider<HabitsNotifier, List<Habit>>((ref) {
  return HabitsNotifier();
});
