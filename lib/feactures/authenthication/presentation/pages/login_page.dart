import 'package:cinemixe_app/core/contants/login_page/constants.dart';
import 'package:cinemixe_app/core/contants/sinup_page/constants.dart';
import 'package:cinemixe_app/core/theme/app_theme.dart';
import 'package:cinemixe_app/core/widgets/text_flied.dart';
import 'package:cinemixe_app/feactures/authenthication/presentation/pages/email_verification_page.dart';
import 'package:cinemixe_app/feactures/authenthication/presentation/pages/sinup_page.dart';
import 'package:cinemixe_app/feactures/authenthication/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  static const routePath = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final constants = ref.watch(signupPageConstantsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(constants.txtLoginTitle),
        actions: [
          IconButton(
              onPressed: () => context.go(SignupPage.routePath),
              icon: const Icon(Icons.account_box))
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(constants.txtEmailLabel),
                const SizedBox(height: 8),
                TextFieldWidget(
                    hinttText: Loginpagetext.textfliedemail,
                    prefixxIcon: Loginpagetext.emailprefixicon,
                    controller: emailController),
                const SizedBox(height: 24),
                Text(constants.txtPasswordLabel),
                const SizedBox(height: 8),
                TextFieldWidget(
                    hinttText: Loginpagetext.textfliedpassword,
                    prefixxIcon: Loginpagetext.passwordprefixicon,
                    suffixxIcon: Loginpagetext.passwordsuffixicon,
                    controller: passwordController),
                const SizedBox(height: 24),
                TextButton(
                    onPressed: () =>
                        context.go(EmailVerificationScreen.routePath),
                    child: const Text("Email verification")),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => ref
                      .read(authenticationProvider.notifier)
                      .login(context, emailController.text,
                          passwordController.text),
                  child: Text(constants.txtLoginTitle),
                ),
                SizedBox(
                  height: AppTheme.of(context).spaces.space_400,
                ),
                TextButton(
                    onPressed: () {
                      ref
                          .read(authenticationProvider.notifier)
                          .resetPasswordbyemail(emailController.text, context);
                    },
                    child: const Text("reset Password"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
