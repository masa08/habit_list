import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:habit_list/hooks/use_l10n.dart';
import 'package:habit_list/main.dart';
import 'package:habit_list/hooks/use_router.dart';
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
    final router = useRouter();
    final habitModel = ref.read(habitsProvider.notifier);

    final title = useState('');
    final shortTermGoal = useState('');
    final longTermGoal = useState('');
    final routineDate = useState('');
    final isEnabled = title.value.isNotEmpty &&
        shortTermGoal.value.isNotEmpty &&
        longTermGoal.value.isNotEmpty &&
        routineDate.value.isNotEmpty;

    onTitleChanged(value) => title.value = value;
    onShortTermGoalChanged(value) => shortTermGoal.value = value;
    onLongTermGoalChanged(value) => longTermGoal.value = value;
    onRoutineDateChanged(value) => routineDate.value = value;

    Future<void> addHabit() async {
      await habitModel.addHabit(
          title: title.value,
          shortTermGoal: shortTermGoal.value,
          longTermGoal: longTermGoal.value,
          routineDate: routineDate.value);
      router.pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(l10n.addText),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(hintText: l10n.habitTitle),
                onChanged: onTitleChanged,
              ),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(hintText: l10n.habitShortTermGoal),
                onChanged: onShortTermGoalChanged,
              ),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(hintText: l10n.habitLongTermGoal),
                onChanged: onLongTermGoalChanged,
              ),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(hintText: l10n.habitRoutineTime),
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
                      child: Text(l10n.register),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
