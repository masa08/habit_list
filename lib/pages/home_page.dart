import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:habit_list/conponents/habit_list.dart';
import 'package:habit_list/model/habit/habit.dart';
import 'package:habit_list/view_model/user.dart';
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
    final user = FirebaseAuth.instance.currentUser;
    final Stream<QuerySnapshot> habitStream = FirebaseFirestore.instance
        .collection('habits')
        .where("userId", isEqualTo: user!.uid)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: habitStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return const Text('Something went wrong');
        if (snapshot.connectionState == ConnectionState.waiting)
          return const Text("Loading");

        var rawHabits = snapshot.data!.docs.map((DocumentSnapshot doc) {
          Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
          return data;
        }).toList();
        var habits = rawHabits.map((habit) {
          return Habit(habit["title"], habit["shortTermGoal"],
              habit["longTermGoal"], habit["routineDate"]);
        }).toList();

        return HabitList(habits: habits);
      },
    );
  }
}
