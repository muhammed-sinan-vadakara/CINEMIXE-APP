import 'package:cinemixe/core/contants/home/home_apiservice_constants.dart';
import 'package:cinemixe/core/theme/app_theme.dart';
import 'package:cinemixe/feactures/home/presentation/providers/home_apiservice_provider.dart';
import 'package:cinemixe/feactures/home/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:cinemixe/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OverViewPage extends HookConsumerWidget {
  static const routhpath = "/overview";
  final HomeApiServiceEntity entity;
  final imagePath = HomeApiServicetokenConstants().imagePath;
  OverViewPage({super.key, required this.entity});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(readmoreProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(entity.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height / 2.5,
                color: Colors.black87,
                child: Image.network("$imagePath${entity.posterPath}"),
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_125,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: entity.title.toUpperCase(),
                      style: AppTheme.of(context)
                          .typography
                          .h600
                          .copyWith(color: Colors.white),
                      children: [
                        TextSpan(text: " (${entity.releaseDate.year})"),
                        TextSpan(
                          text: "    ⭐${entity.voteAverage.toStringAsFixed(1)}",
                          style: AppTheme.of(context)
                              .typography
                              .h500
                              .copyWith(color: Colors.yellow),
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_125,
              ),
              RichText(
                text: TextSpan(
                  text: entity.overview.isEmpty
                      ? null
                      : isExpanded
                          ? entity.overview
                          : entity.overview
                              .substring(0, entity.overview.length ~/ 2),
                  style: const TextStyle(color: Colors.white54),
                  children: [
                    TextSpan(
                      text: entity.overview.isEmpty
                          ? null
                          : isExpanded
                              ? ' Read Less...'
                              : ' Read More...',
                      style: AppTheme.of(context)
                          .typography
                          .h400
                          .copyWith(color: Colors.white60),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          ref.read(readmoreProvider.notifier).state =
                              !isExpanded;
                        },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_150,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const YoutubeButtonWidget(),
                  const SizedBox(
                    width: 10,
                  ),
                  StreamBuilder(
                      stream: ref
                          .watch(homeApiServiceProviderProvider)
                          .value!
                          .favMoviesStream,
                      builder: (context, snapshot) {
                        final isFavMovie = ref
                            .read(homeApiServiceProviderProvider.notifier)
                            .isMovieFavourite(entity.id);

                        return IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: const Color(0xFFCD201F),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15)),
                          onPressed: () {
                            if (isFavMovie) {
                              ref
                                  .read(homeApiServiceProviderProvider.notifier)
                                  .deleteFromFireStore(entity.id);
                            } else {
                              ref
                                  .read(homeApiServiceProviderProvider.notifier)
                                  .addtoFireStore(entity);
                            }
                          },
                          icon: Icon(
                            isFavMovie 
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 35,
                            color: Colors.white,
                          ),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      // Column(
      //   children: [
      //     Container(
      //       decoration:
      //           BoxDecoration(borderRadius: BorderRadius.circular(1320)),
      //       height: MediaQuery.sizeOf(context).height / 2,
      //       width: MediaQuery.sizeOf(context).width,
      //       child: Image.network(imagePath + entity.posterPath),
      //     ),
      //     Text(entity.title),
      //     Row(
      //       children: [
      //         IconButton(
      //             onPressed: () {},
      //             icon: Icon(
      //               Icons.star,
      //               color: Colors.yellow,
      //             ))
      //       ],
      //     ),
      //     Text(entity.overview),
      //   ],
      // ),
    );
  }
}
