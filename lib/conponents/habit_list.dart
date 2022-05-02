import 'package:flutter/material.dart';
import 'package:habit_list/domain/habit.dart';

class HabitList extends StatelessWidget {
  final List<Habit> habits;
  final bool isSetting;
  const HabitList({Key? key, this.isSetting = false, required this.habits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            contentPadding: const EdgeInsets.all(8),
            title: Column(
              children: [
                Text(habits[index].title),
                Text("短期目標: " + habits[index].shortTermGoal, style: const TextStyle(
                  fontSize: 12
                ),),
                Text("長期目標: " + habits[index].shortTermGoal, style: const TextStyle(
                  fontSize: 12
                ),),
                Text("時間: " + habits[index].routineDate, style: const TextStyle(
                  fontSize: 12
                ),)
              ],
            ),
            trailing: isSetting ?  const Icon(Icons.settings) : null
          ),
        );
      }),
    );
  }
}
