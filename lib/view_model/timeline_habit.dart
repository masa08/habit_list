import 'package:habit_list/model/habit/habit.dart';
import 'package:habit_list/model/habit/repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 自分のhabitを管理する責務
class TimeLineHabitsNotifier extends StateNotifier<List<Habit>> {
  TimeLineHabitsNotifier(this._repository) : super([]);

  final HabitRepositoryInterface _repository;

  Future<void> initHabit() async {
    final habits = await _repository.initTimeLine();
    state = habits;
  }
}
