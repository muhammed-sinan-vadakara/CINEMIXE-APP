import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe_app/feactures/home/presentation/pages/overviewpage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget(
      {super.key,
      required this.value,
      required this.imagePath,
      required this.height,
      required this.height2,
      required this.width,
      required this.width2,
      required this.boxFit,
      required this.axis});

  final List<HomeApiServiceEntity> value;
  final String imagePath;
  final double height;
  final double? height2;
  final double width;
  final double? width2;
  final Axis axis;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: value.length,
      shrinkWrap: true,
      scrollDirection: axis,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () =>
                  context.push(OverViewPage.routePath, extra: value[index]),
              child: Container(
                height: height,
                width: width2,
                color: Colors.grey.shade800,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        '$imagePath${value[index].posterPath}',
                        fit: boxFit,
                      ),
                    ),
                    SizedBox(
                      width: width,
                      height: height2,
                      child: Center(
                        child: Text(
                          value[index].title,
                          style: const TextStyle(color: Colors.white),
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
    );
  }
}
