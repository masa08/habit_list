import 'package:flutter/material.dart';
import 'package:habit_list/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  // TODO: initialize
  runApp(
    const ProviderScope(
      child: App())
    );
}
