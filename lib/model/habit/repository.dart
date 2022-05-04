// TODO: DIできるようにして、firebaseの知識をここから逃す
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_list/model/habit/habit.dart';

class HabitRepository {
  final user = FirebaseAuth.instance.currentUser;

  Future<List<Habit>> initHome() async {
    final fsHabits = await FirebaseFirestore.instance
        .collection('habits')
        .where("userId", isEqualTo: user!.uid)
        .get();
    final habits = fsHabits.docs.map((habit) {
      // TODO: json serializeでなんとかしたい。
      return Habit(habit["title"], habit["shortTermGoal"],
          habit["longTermGoal"], habit["routineDate"]);
    }).toList();
    return habits;
  }

  Future<List<Habit>> initTimeLine() async {
    final fsHabits =
        await FirebaseFirestore.instance.collection('habits').get();
    final habits = fsHabits.docs.map((habit) {
      return Habit(habit["title"], habit["shortTermGoal"],
          habit["longTermGoal"], habit["routineDate"]);
    }).toList();
    return habits;
  }

  Future<void> add(Habit habit) async {
    CollectionReference habits =
        FirebaseFirestore.instance.collection('habits');

    await habits.add({
      "title": habit.title,
      "shortTermGoal": habit.shortTermGoal,
      "longTermGoal": habit.longTermGoal,
      "routineDate": habit.routineDate,
      "userId": user!.uid,
    });
  }
}
