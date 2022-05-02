import 'package:flutter/material.dart';
import 'package:habit_list/hooks/use_l10n.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.add),
      ),
      body: const Center(
        child: Text("add habit page"),
      ),
    );
  }
}
