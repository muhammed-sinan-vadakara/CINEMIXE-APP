import 'package:cinemixe_app/core/contants/home/home_apiservice_constants.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe_app/feactures/home/presentation/pages/overviewpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GridViewWidget extends ConsumerWidget {
  final List<HomeApiServiceEntity> entity;
  final imagePath = HomeApiServicetokenConstants().imagePath;
  GridViewWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      itemCount: entity.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 200,
          mainAxisSpacing: 15,
          crossAxisSpacing: 10),
      itemBuilder: (context, index) => InkWell(
        onTap: () => context.push(OverViewPage.routePath, extra: entity[index]),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imagePath + entity[index].posterPath),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
