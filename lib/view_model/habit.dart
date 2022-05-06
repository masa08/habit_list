import 'package:habit_list/model/habit/habit.dart';
import 'package:habit_list/model/habit/repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 自分のhabitを管理する責務
class HabitsNotifier extends StateNotifier<List<Habit>> {
  HabitsNotifier(this._repository) : super([]);

  final HabitRepositoryInterface _repository;

  Future<void> initHabit() async {
    final habits = await _repository.initHome();
    state = habits;
  }

  Future<void> addHabit(
      {required String title,
      required String shortTermGoal,
      required String longTermGoal,
      required String routineDate}) async {
    final habit = Habit(title, shortTermGoal, longTermGoal, routineDate);
    await _repository.add(habit);
    state = [...state, habit];
  }
}
