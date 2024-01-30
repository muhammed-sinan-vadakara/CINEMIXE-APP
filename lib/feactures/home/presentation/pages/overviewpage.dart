import 'package:cinemixe/core/contants/home/home_apiservice_constants.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(entity.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(1320)),
            height: MediaQuery.sizeOf(context).height / 2,
            width: MediaQuery.sizeOf(context).width,
            child: Image.network(imagePath + entity.posterPath),
          ),
          Text(entity.title),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ))
            ],
          ),
          Text(entity.overview),
        ],
      ),
    );
  }
}
