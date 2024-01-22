import 'package:cinemixe/core/contants/home/homepage_constants.dart';
import 'package:cinemixe/feactures/home/presentation/providers/home_apiservice_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeApiServicePage extends ConsumerWidget {
  // final imagePath = 'https://image.tmdb.org/t/p/w500/';
  static const routePath = "/";
  const HomeApiServicePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(homePageConstantsProvider);
    final apidata = ref.watch(homeApiServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(constants.tittle),
        actions: [constants.settingsIcon],
      ),
      body: Center(
        child: switch (apidata) {
          AsyncData(:final value) => GestureDetector(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Container(
                    //   height: 100,
                    //   color: Colors.grey.shade800,
                    //   padding: const EdgeInsets.all(16.0),
                    //   child: Column(
                    //     children: [
                    // Expanded(
                    //   child: Image.network(
                    //     '$imagePath${value[1].posterPath}',
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    Text(
                      value[1].title,
                      style: const TextStyle(color: Colors.red),
                    ),
                    // ],
                    // ),
                    // ),
                  ],
                ),
              ),
            ),
          AsyncError(:final error) => Column(
              children: [
                Text(
                  "Error : $error",
                  style: const TextStyle(color: Colors.amber),
                ),
                Text("no internet")
              ],
            ),
          _ => const CircularProgressIndicator(),
        },
      ),
    );
  }
}
