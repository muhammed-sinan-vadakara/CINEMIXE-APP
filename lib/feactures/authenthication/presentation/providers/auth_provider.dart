import 'package:cinemixe_app/core/exceptions/base_exception.dart';
import 'package:cinemixe_app/core/utils/snackbar_utils.dart';
import 'package:cinemixe_app/feactures/authenthication/data/repositoies/auth_repository_impl.dart';
import 'package:cinemixe_app/feactures/authenthication/domain/repositories/auth_repository.dart';
import 'package:cinemixe_app/feactures/authenthication/domain/usecases/email_verification_usecase.dart';
import 'package:cinemixe_app/feactures/authenthication/domain/usecases/google_verification_usecase.dart';
import 'package:cinemixe_app/feactures/authenthication/domain/usecases/login_usecase.dart';
import 'package:cinemixe_app/feactures/authenthication/domain/usecases/logout_usecase.dart';
import 'package:cinemixe_app/feactures/authenthication/domain/usecases/otp_verification_usecase.dart';
import 'package:cinemixe_app/feactures/authenthication/domain/usecases/phone_number_verification_usecase.dart';
import 'package:cinemixe_app/feactures/authenthication/domain/usecases/reset_password_usecase.dart';
import 'package:cinemixe_app/feactures/authenthication/domain/usecases/signup_usecase.dart';
import 'package:cinemixe_app/feactures/authenthication/presentation/pages/login_page.dart';
import 'package:cinemixe_app/feactures/authenthication/presentation/pages/otp_checking_page.dart';
import 'package:cinemixe_app/feactures/authenthication/presentation/providers/authentication_state_provider.dart';
import 'package:cinemixe_app/feactures/home/presentation/pages/homepage.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  late final AuthRepository repository;
  @override
  AuthenticationState build() {
    repository = ref.read(authRepositoryProvider);
    return AuthenticationState(verificationId: '', resendToken: null);
  }

  Future<void> signup(
      BuildContext context, String email, String password) async {
    try {
      await SignupUsecase(repository: ref.read(authRepositoryProvider))(
          email, password);
      await verifyEmail(context);
      Future.sync(() => context.go(HomeApiServicePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      await LoginUsecase(repository: ref.read(authRepositoryProvider))(
          email, password);
      Future.sync(() => context.go(HomeApiServicePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> verifyEmail(BuildContext context) async {
    try {
      await EmailVerificationUsecase(
          repository: ref.read(authRepositoryProvider))();
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await LogoutUsecase(repository: ref.read(authRepositoryProvider))();
      Future.sync(() => context.go(LoginPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> resetPasswordbyemail(String email, BuildContext context) async {
    try {
      await ResetPasswordbyEmailUsecase(
          repository: ref.read(authRepositoryProvider))(email);
      Future.sync(() => context.go(LoginPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> phoneNumberVerfication(
      BuildContext context, String phoneNumber) async {
    try {
      final verificationData = await PhoneNumberVerificationUsecase(
          repository: ref.read(authRepositoryProvider))(phoneNumber);
      state = AuthenticationState(
          verificationId: verificationData.$1,
          resendToken: verificationData.$2);
      Future.sync(() => context.go(OtpCheckingPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> verifyOtp(BuildContext context, String otp) async {
    try {
      await VerifyOtpUsecase(repository: repository)(state.verificationId, otp);
      Future.sync(() => context.go(HomeApiServicePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> googleverification(BuildContext context) async {
    try {
      await GoogleVerificationUsecase(
          repository: ref.read(authRepositoryProvider))();
      Future.sync(() => context.go(HomeApiServicePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }
}
