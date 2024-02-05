import 'package:cinemixe_app/core/objectbox/home_movie_objectbox.dart';
import 'package:cinemixe_app/core/objectbox/home_popular_object.dart';
import 'package:cinemixe_app/core/objectbox/home_toprated_objectbox.dart';
import 'package:cinemixe_app/core/theme/light_theme.dart';
import 'package:cinemixe_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'core/router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HomeMovieStoreObjectBox.createMethod();
  await PopularObjectBox.createMethod();
  await TopRatedObjectBox.createMethod();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(overrides: [], child: MovieApp()));
}

class MovieApp extends ConsumerWidget {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final navigatorKey = GlobalKey<NavigatorState>();
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: "Cinemixe App",
      debugShowCheckedModeBanner: false,
      theme: ref.watch(lightThemeProvider),
      routerConfig: ref.watch(routerProvider),
    );
  }
}
