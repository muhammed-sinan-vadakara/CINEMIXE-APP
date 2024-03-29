import 'package:cinemixe_app/feactures/authenthication/presentation/pages/email_verification_page.dart';
import 'package:cinemixe_app/feactures/authenthication/presentation/pages/login_page.dart';
import 'package:cinemixe_app/feactures/authenthication/presentation/pages/otp_checking_page.dart';
import 'package:cinemixe_app/feactures/authenthication/presentation/pages/sinup_page.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe_app/feactures/home/presentation/pages/favarite_page.dart';
import 'package:cinemixe_app/feactures/home/presentation/pages/homepage.dart';
import 'package:cinemixe_app/feactures/home/presentation/pages/overviewpage.dart';
import 'package:cinemixe_app/feactures/home/presentation/pages/search_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _router = GoRouter(
  initialLocation: HomeApiServicePage.routePath,
  routes: [
    GoRoute(
      path: HomeApiServicePage.routePath,
      builder: (context, state) => HomeApiServicePage(),
      redirect: (context, state) {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null || !user.emailVerified && user.phoneNumber == null) {
          return LoginPage.routePath;
        }
        return null;
      },
    ),
    GoRoute(
      path: OverViewPage.routePath,
      builder: (context, state) =>
          OverViewPage(entity: state.extra as HomeApiServiceEntity),
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
      path: FavouriteMoviesPage.routePath,
      builder: (context, state) => const FavouriteMoviesPage(),
    ),
    GoRoute(
      path: SearchPage.routePath,
      builder: (context, state) => const SearchPage(),
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
