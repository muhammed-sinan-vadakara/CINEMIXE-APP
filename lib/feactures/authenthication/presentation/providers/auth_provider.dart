import 'package:cinemixe/core/exceptions/authentication/base_exception.dart';
import 'package:cinemixe/core/utils/snackbar_utils.dart';
import 'package:cinemixe/feactures/authenthication/domain/usecases/login_usecase.dart';
import 'package:cinemixe/feactures/authenthication/domain/usecases/logout_usecase.dart';
import 'package:cinemixe/feactures/authenthication/domain/usecases/signup_usecase.dart';
import 'package:cinemixe/feactures/authenthication/presentation/pages/home_page.dart';
import 'package:flutter/widgets.dart';

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

  Future<void> logout() async {
    try {
      await LogoutUsecase(repository: ref.watch(authRepositoryProvider))();
      Future.sync(() => context.go(LoginPage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }
}
