import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_list/model/habit/habit.dart';
import 'package:habit_list/model/habit/repository.dart';

class FirebaseHabitRepository implements HabitRepositoryInterface {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Future<List<Habit>> initHome() async {
    if (user == null) return [];
    final fsHabits = await FirebaseFirestore.instance
        .collection('habits')
        .where("userId", isEqualTo: user?.uid)
        .get();
    final habits = fsHabits.docs.map((habit) {
      return Habit.fromJson(habit.data());
    }).toList();
    return habits;
  }

  @override
  Future<List<Habit>> initTimeLine() async {
    final fsHabits =
        await FirebaseFirestore.instance.collection('habits').get();
    final habits = fsHabits.docs.map((habit) {
      return Habit.fromJson(habit.data());
    }).toList();
    return habits;
  }

  @override
  Future<void> add(Habit habit) async {
    Map<String, dynamic> jsonData = habit.toJson();

    CollectionReference habits =
        FirebaseFirestore.instance.collection('habits');
    await habits.add(jsonData);
  }
}
