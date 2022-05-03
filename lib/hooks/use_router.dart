// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

GoRouter useRouter() {
  final context = useContext();
  return GoRouter.of(context);
}
