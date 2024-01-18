import 'package:cinemixe/core/exceptions/base_exception.dart';
import 'package:cinemixe/core/utils/snackbar_utils.dart';
import 'package:cinemixe/feactures/authenthication/data/repositoies/auth_repository_impl.dart';
import 'package:cinemixe/feactures/authenthication/domain/usecases/email_verification_usecase.dart';
import 'package:cinemixe/feactures/authenthication/domain/usecases/google_verification_usecase.dart';
import 'package:cinemixe/feactures/authenthication/domain/usecases/login_usecase.dart';
import 'package:cinemixe/feactures/authenthication/domain/usecases/logout_usecase.dart';
import 'package:cinemixe/feactures/authenthication/domain/usecases/reset_password_usecase.dart';
import 'package:cinemixe/feactures/authenthication/domain/usecases/signup_usecase.dart';
import 'package:cinemixe/feactures/authenthication/presentation/pages/home_page.dart';
import 'package:cinemixe/feactures/authenthication/presentation/pages/login_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class Authentication extends _$Authentication {
  @override
  void build(BuildContext context) {
    this.context = context;
  }

  Future<void> signup(String email, String password) async {
    try {
      await SignupUsecase(repository: ref.watch(authRepositoryProvider))(
          email, password);
      await verifyEmail();
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await LoginUsecase(repository: ref.watch(authRepositoryProvider))(
          email, password);
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> verifyEmail() async {
    try {
      await EmailVerificationUsecase(
          repository: ref.watch(authRepositoryProvider))();
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> logout() async {
    try {
      await LogoutUsecase(repository: ref.watch(authRepositoryProvider))();
      Future.sync(() => context.go(LoginPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> resetPasswordbyemail() async {
    try {
      await ResetPasswordbyEmailUsecase(
          repository: ref.watch(authRepositoryProvider))();
      Future.sync(() => context.go(LoginPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> googleverification() async {
    try {
      await GoogleVerificationUsecase(
          repository: ref.watch(authRepositoryProvider))();
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }
}
