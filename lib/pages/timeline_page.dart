import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimeLinePage extends StatelessWidget {
  const TimeLinePage({Key? key}) : super(key: key);

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
    return const Center(
      child: Text('timeline page'),
    );
  }
}
