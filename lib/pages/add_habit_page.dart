import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_list/hooks/use_l10n.dart';
import 'package:habit_list/state/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddHabitPage extends StatelessWidget {
  const AddHabitPage({Key? key}) : super(key: key);

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
    final l10n = useL10n();
    final user = ref.watch(userProvider);

    final title = useState('');
    final shortTermGoal = useState('');
    final longTermGoal = useState('');
    final routineDate = useState('');

    final isEnabled = title.value.isNotEmpty && shortTermGoal.value.isNotEmpty && longTermGoal.value.isNotEmpty && routineDate.value.isNotEmpty;

    onTitleChanged (value) {
      title.value = value;
    }
    onShortTermGoalChanged (value) {
      shortTermGoal.value = value;
    }
    onLongTermGoalChanged (value) {
      longTermGoal.value = value;
    }
    onRoutineDateChanged (value) {
      routineDate.value = value;
    }

    Future<void> addHabit () {
      CollectionReference habits = FirebaseFirestore.instance.collection('habits');
      return habits.add({
        "title": title.value,
        "shortTermGoal": shortTermGoal.value,
        "longTermGoal": longTermGoal.value,
        "routineDate": routineDate.value,
        "userId": user!.uid,
      })
      .then((value) => print("habit Added"))
      .catchError((error) => print("Failed to add habit: $error"));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("習慣を入力してください"),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "習慣名"
                ),
                onChanged: onTitleChanged,
              ),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "短期目標"
                ),
                onChanged: onShortTermGoalChanged,
              ),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "長期目標"
                ),
                onChanged: onLongTermGoalChanged,
              ),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "時間指定"
                ),
                onChanged: onRoutineDateChanged,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: SizedBox(
                width: 260,
                height: 50,
                child: ElevatedButton(
                    onPressed: isEnabled ? addHabit : null,
                    child: const Text("登録する"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    )
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
