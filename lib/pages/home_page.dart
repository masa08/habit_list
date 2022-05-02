import 'package:flutter/material.dart';
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
    return Center(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              title: Column(
                children: const [
                  Text("筋トレを継続的に行う"),
                  Text("効果: 活力に満ちた自分", style: TextStyle(
                    fontSize: 12
                  ),)
                ],
              ),
            ),
          );
        }),
      );
  }
}
