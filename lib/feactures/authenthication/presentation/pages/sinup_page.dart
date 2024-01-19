import 'package:cinemixe/core/contants/login_page/constants.dart';
import 'package:cinemixe/core/contants/sinup_page/constants.dart';
import 'package:cinemixe/core/widgets/text_flied.dart';
import 'package:cinemixe/feactures/authenthication/presentation/pages/login_page.dart';
import 'package:cinemixe/feactures/authenthication/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class SignupPage extends HookConsumerWidget {
  static const routePath = '/signup';
  const SignupPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneNumberController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final constants = ref.watch(signupPageConstantsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(constants.txtSignupTitle),
        actions: [
          IconButton(
              onPressed: () => context.go(LoginPage.routePath),
              icon: const Icon(Icons.login))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                  height: 150,
                  width: 300,
                  child: Lottie.asset("assets/animations/signuppage.json",
                      fit: BoxFit.cover)),
            ),
            Padding(
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
                  Text(constants.phoneNumber),
                  const SizedBox(height: 8),
                  TextFieldWidget(
                      hinttText: constants.phoneNumberlabel,
                      prefixxIcon: constants.phoneprefixicon,
                      controller: phoneNumberController),
                  const SizedBox(height: 24),
                  Text(constants.txtPasswordPlaceholder),
                  const SizedBox(height: 8),
                  TextFieldWidget(
                      hinttText: Loginpagetext.textfliedpassword,
                      prefixxIcon: Loginpagetext.passwordprefixicon,
                      suffixxIcon: Loginpagetext.passwordsuffixicon,
                      controller: passwordController),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () => ref
                        .read(authenticationProvider(context).notifier)
                        .signup(emailController.text, passwordController.text),
                    child: Text(constants.txtSignupBtnLabel),
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () => ref
                        .read(authenticationProvider(context).notifier)
                        .googleverification(),
                    child: const Text("GOOGLE"),
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () => ref
                        .read(authenticationProvider(context).notifier)
                        .phoneNumberVerfication(phoneNumberController.text),
                    child: const Text("phone number verfy"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}













































// import 'package:cinemixe/core/contants/login_page/constants.dart';
// import 'package:cinemixe/core/theme/app_theme.dart';
// import 'package:cinemixe/core/widgets/text_flied.dart';
// import 'package:cinemixe/feactures/authenthication/presentation/widgets/button.dart';
// import 'package:flutter/material.dart';

// class SignupPage extends StatelessWidget {
//   static const routePath = "/signup";
//   const SignupPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController usercontroller = TextEditingController();
//     TextEditingController passwordcontroller = TextEditingController();
//     return Scaffold(
//       body: Column(
//         children: [
//           //sized box
//           SizedBox(
//             height: AppTheme.of(context).spaces.space_900,
//           ),

//           //textfield for email
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: TextFieldWidget(
//                 controller: usercontroller,
//                 hinttText: Loginpagetext.textfliedemail,
//                 prefixxIcon: Loginpagetext.emailprefixicon),
//           ),

//           //sized box
//           SizedBox(
//             height: AppTheme.of(context).spaces.space_400,
//           ),

//           //text field for password
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: TextFieldWidget(
//               controller: passwordcontroller,
//               hinttText: Loginpagetext.textfliedpassword,
//               prefixxIcon: Loginpagetext.passwordprefixicon,
//               suffixxIcon: Loginpagetext.passwordsuffixicon,
//             ),
//           ),

//           //sized box
//           SizedBox(
//             height: AppTheme.of(context).spaces.space_400,
//           ),

//           //login button
//           SignupLoginButton(buttonText: Loginpagetext.buttonlogin)
//         ],
//       ),
//     );
//   }
// }
