import 'package:cinemixe_app/core/theme/app_theme.dart';
import 'package:cinemixe_app/feactures/home/presentation/pages/favarite_page.dart';
import 'package:cinemixe_app/feactures/home/presentation/pages/homepage.dart';
import 'package:cinemixe_app/feactures/home/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Colors.purple.withOpacity(.80),
      selectedItemColor: Colors.white,
      unselectedItemColor: AppTheme.of(context).colors.textSubtlest,
      iconSize: AppTheme.of(context).spaces.space_400,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  context.go(HomeApiServicePage.routePath);
                },
                icon: const Icon(Icons.home_filled)),
            label: ''),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  context.push(SearchPage.routePath);
                },
                icon: const Icon(Icons.search)),
            label: ''),
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  context.push(FavouriteMoviesPage.routePath);
                },
                icon: const Icon(Icons.favorite)),
            label: ''),
      ],
    );
  }
}
