import 'package:cinemixe_app/core/contants/home/homepage_constants.dart';
import 'package:cinemixe_app/core/theme/app_theme.dart';
import 'package:cinemixe_app/core/widgets/text_flied.dart';
import 'package:cinemixe_app/feactures/home/presentation/providers/home_apiservice_provider.dart';
import 'package:cinemixe_app/feactures/home/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:cinemixe_app/feactures/home/presentation/widgets/gridview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchPage extends HookConsumerWidget {
  static const routePath = '/search';
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text(
            ref.watch(homePageConstantsProvider).tittle,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 32, 31, 31),
        ),
        backgroundColor: const Color.fromARGB(255, 32, 31, 31),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldWidget(
                  hinttText: "Enter Movie Name",
                  prefixxIcon: Icon(Icons.movie_creation_outlined),
                  controller: controller,
                  suffixxIcon: IconButton(
                      onPressed: () {
                        ref
                            .watch(homeApiServiceProviderProvider.notifier)
                            .searchMovies(controller.text, context);
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white70,
                        size: 30,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Results :',
                  style: AppTheme.of(context)
                      .typography
                      .h600
                      .copyWith(color: Colors.white),
                ),
                Builder(
                  builder: (context) {
                    return ref.watch(homeApiServiceProviderProvider).when(
                          data: (data) {
                            if (data.searchMovies == null) {
                              return Center(
                                child: TextButton(
                                    onPressed: () {
                                      ref
                                          .read(homeApiServiceProviderProvider
                                              .notifier)
                                          .searchMovies(
                                              controller.text, context);
                                    },
                                    child: const Text(
                                      "No data available",
                                      style: TextStyle(color: Colors.red),
                                    )),
                              );
                            } else {
                              return SizedBox(
                                  height: 700,
                                  child: GridViewWidget(
                                      entity: data.searchMovies!));
                            }
                          },
                          error: (error, stackTrace) => Center(
                            child: Text(error.toString()),
                          ),
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                  },
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(),
      ),
    );
  }
}
