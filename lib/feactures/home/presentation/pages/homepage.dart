import 'package:cinemixe/core/contants/home/homepage_constants.dart';
import 'package:cinemixe/feactures/home/presentation/providers/home_apiservice_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeApiServicePage extends ConsumerWidget {
  final imagePath = 'https://image.tmdb.org/t/p/w500/';
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
      body: switch (apidata) {
        AsyncData(:final value) => GestureDetector(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height / 2.5,
                        color: const Color.fromARGB(255, 42, 47, 51),
                        child: ListView.builder(
                          itemCount: value.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  onTap: () {
                                    // context.push(homea.routePath,
                                    //     extra: (HomeApiServiceEntity));
                                  },
                                  child: Container(
                                    height: 100,
                                    color: Colors.grey.shade800,
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Image.network(
                                            '$imagePath${value[index].posterPath}',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 150,
                                          child: Center(
                                            child: Text(
                                              value[index].title,
                                              style: const TextStyle(
                                                  color: Colors.white),
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
                            itemCount: value.length,
                            shrinkWrap: true,
                            // scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: InkWell(
                                    onTap: () {
                                      // context.push(MyHerp.routePath,
                                      //     extra: (MovieEntity));
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
                                                '$imagePath${value[index].posterPath}',
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
                                                value[index].title,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 19),
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
                      ))
                ],
              ),
            ),
          ),
        AsyncError(:final error) => Text(
            "Error : $error",
            style: const TextStyle(color: Colors.amber),
          ),
        _ => const CircularProgressIndicator(),
      },
    );
  }
}
