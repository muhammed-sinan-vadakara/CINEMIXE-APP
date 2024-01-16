import 'package:cinemixe/core/contants/sinup_page/constants.dart';
import 'package:cinemixe/feactures/authenthication/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  static const routePath = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(signupPageConstantsProvider).txtHomeTitle),
        actions: [
          IconButton(
            onPressed: () =>
                ref.read(authenticationProvider(context).notifier).logout(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
