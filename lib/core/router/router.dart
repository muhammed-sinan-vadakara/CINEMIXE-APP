import 'package:cinemixe/feactures/authenthication/presentation/pages/sinup_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'router.g.dart';

final router = GoRouter(initialLocation: SignupPage.routePath, routes: [
  GoRoute(
      path: SignupPage.routePath,
      builder: (context, State) => const SignupPage())
]);

@riverpod
GoRouter router(RouterRef ref) {
  return _router;
}
