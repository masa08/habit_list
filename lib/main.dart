import 'package:anime_log/app.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  // TODO: initialize
  runApp(
    const ProviderScope(
      child: App())
    );
}
