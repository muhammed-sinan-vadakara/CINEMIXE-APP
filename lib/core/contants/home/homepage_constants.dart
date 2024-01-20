import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'homepage_constants.g.dart';

final class HomePageConstants {
  //app bar text
  final tittle = "CINEMIXE APP";

  //app bar icons
  final settingsIcon = const Icon(Icons.settings);
  final moreIcon = const Icon(Icons.more_vert);
  final personIcon = const Icon(Icons.person);
}

@riverpod
HomePageConstants homePageConstants(HomePageConstantsRef ref) {
  return HomePageConstants();
}
