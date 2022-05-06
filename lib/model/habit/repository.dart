import 'package:habit_list/model/habit/habit.dart';

abstract class HabitRepositoryInterface {
  Future<List<Habit>> initHome();

  Future<List<Habit>> initTimeLine();

  Future<void> add(Habit habit);
}
