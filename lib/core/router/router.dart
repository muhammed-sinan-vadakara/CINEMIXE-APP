import 'package:cinemixe/feactures/authenthication/presentation/pages/email_verification_page.dart';
import 'package:cinemixe/feactures/authenthication/presentation/pages/login_page.dart';
import 'package:cinemixe/feactures/authenthication/presentation/pages/otp_checking_page.dart';
import 'package:cinemixe/feactures/authenthication/presentation/pages/sinup_page.dart';
import 'package:cinemixe/feactures/home/presentation/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _router = GoRouter(
  initialLocation: LoginPage.routePath,
  routes: [
    GoRoute(
      path: HomeApiServicePage.routePath,
      builder: (context, state) => const HomeApiServicePage(),
      redirect: (context, state) {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null || !user.emailVerified) {
          return LoginPage.routePath;
        }
        return null;
      },
    ),
    GoRoute(
      path: SignupPage.routePath,
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: LoginPage.routePath,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: OtpCheckingPage.routePath,
      builder: (context, state) => const OtpCheckingPage(),
    ),
    GoRoute(
        path: EmailVerificationScreen.routePath,
        builder: (context, state) => const EmailVerificationScreen())
  ],
);

@riverpod
GoRouter router(RouterRef ref) {
  return _router;
}
