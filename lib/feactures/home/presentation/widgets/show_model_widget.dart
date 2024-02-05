import 'package:cinemixe_app/feactures/home/data/datasource/home_apiservice_datasource_impl.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/home_apiservice_entity.dart';
import 'package:cinemixe_app/feactures/home/domain/entities/review_home_entity.dart';
import 'package:cinemixe_app/feactures/home/presentation/providers/home_apiservice_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShowModelWidget extends HookConsumerWidget {
  final HomeApiServiceEntity entity;
  const ShowModelWidget({super.key, required this.entity});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewController = useTextEditingController();
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        height: 180,
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: reviewController,
                  decoration: const InputDecoration(
                    isCollapsed: false,
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Add a Review',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black87,
                        width: 10,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      ref
                          .watch(homeApiServiceProviderProvider.notifier)
                          .addReview(ReviewHomeEntity(
                            review: reviewController.text,
                            movieId: entity.id,
                            id: '',
                          ));
                      context.pop();
                    },
                    child: const Text("Add"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
