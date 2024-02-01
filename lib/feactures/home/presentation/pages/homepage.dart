import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinemixe/core/contants/home/home_apiservice_constants.dart';
import 'package:cinemixe/core/contants/home/homepage_constants.dart';
import 'package:cinemixe/feactures/authenthication/presentation/providers/auth_provider.dart';
import 'package:cinemixe/feactures/home/presentation/pages/favarite_page.dart';
// import 'package:cinemixe/core/theme/app_theme.dart';
// import 'package:cinemixe/feactures/authenthication/presentation/pages/login_page.dart';
import 'package:cinemixe/feactures/home/presentation/pages/overviewpage.dart';
import 'package:cinemixe/feactures/home/presentation/providers/home_apiservice_provider.dart';
import 'package:cinemixe/feactures/home/presentation/widgets/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeApiServicePage extends ConsumerWidget {
  static const routePath = '/';
  final imagePath = HomeApiServicetokenConstants().imagePath;
  final int? itemcount;

  HomeApiServicePage({
    super.key,this.itemcount
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apidata = ref.watch(homeApiServiceProviderProvider);
    final constants = ref.watch(homePageConstantsProvider);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          constants.tittle,
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              // context.push(FavaritePage.routePath);
            },
            icon: const Icon(Icons.abc)),
        // constants.settingsIcon,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(500), top: Radius.circular(500)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: constants.personIcon,
              onPressed: () =>
                  ref.read(authenticationProvider.notifier).logout(context),
            ),
          ),
        ],
      ),
      body: switch (apidata) {
        AsyncData(:final value) => SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: 100,
                    child: CarouselSlider.builder(
                        itemCount: value.getMovies.length,
                        itemBuilder: (context, index, realIndex) => InkWell(
                              child: Container(
                                height: 100,
                                width: 50,
                                color: Colors.amber,
                                child: Image.network(
                                    '$imagePath${value.getMovies[index].posterPath}'),
                              ),
                            ),
                        options: CarouselOptions(
                            height: 200,
                            autoPlay: true,
                            clipBehavior: Clip.antiAlias,
                            autoPlayAnimationDuration:
                                const Duration(seconds: 2)))),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height / 2.5,
                      child: ListViewWidget(
                          value: value.getMovies,
                          imagePath: imagePath,
                          height: 100,
                          height2: null,
                          width: 150,
                          width2: null,
                          boxFit: BoxFit.cover,
                          axis: Axis.horizontal),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      color: const Color.fromARGB(255, 17, 6, 6),
                      child: ListView.builder(
                        itemCount: value.getMovies.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                onTap: () {
                                  context.push(OverViewPage.routhpath,
                                      extra: value.getMovies[index]);
                                },
                                child: Container(
                                  height: 300,
                                  width: 200,
                                  color: Colors.grey.shade800,
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 300,
                                        height: 200,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            '$imagePath${value.getMovies[index].posterPath}',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 250,
                                        child: Center(
                                          child: Text(
                                            value.getMovies[index].title,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        AsyncError(:final error) => Center(
            child: Text(
              'Error: $error',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        _ => const Center(child: CircularProgressIndicator()),
      },
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.home))
          ],
        ),
      ),
    ));
  }
}
