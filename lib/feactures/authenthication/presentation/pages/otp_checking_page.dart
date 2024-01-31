import 'package:cinemixe/core/contants/otp_checker_page/constants.dart';
import 'package:cinemixe/core/widgets/text_flied.dart';
import 'package:cinemixe/feactures/authenthication/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OtpCheckingPage extends HookConsumerWidget {
  static const routePath = '/otp';
  const OtpCheckingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpVerificationphoneController = useTextEditingController();
    final constants = ref.watch(otpcheckingpagetextProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(constants.tittle),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Text(constants.heading),
              TextFieldWidget(
                  controller: otpVerificationphoneController,
                  hinttText: constants.hinttext,
                  prefixxIcon: constants.prefixxIcon,
                  suffixxIcon: constants.suffixxIcon),
              ElevatedButton(
                  onPressed: () => ref
                      .read(authenticationProvider.notifier)
                      .verifyOtp(context, otpVerificationphoneController.text),
                  child: Text(constants.buttontext))
            ],
          ),
        ),
      ),
    );
  }
}
