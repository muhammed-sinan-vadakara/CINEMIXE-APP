import 'package:cinemixe/core/contants/home/homepage_constants.dart';
import 'package:cinemixe/core/widgets/text_flied.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Testing extends HookConsumerWidget {
  static const routePath = "/testing";
  const Testing({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final user = <String, dynamic>{"test": 200};
    db.collection("user").add(user).then((DocumentReference doc) {});
    // print("DocumentSnapshot added with ID: ${doc.id}"));
    // final storage = FirebaseStorage.instance;
    
    final keycontroller = useTextEditingController();
    final valuecontroller = useTextEditingController();
    final constants = ref.watch(homePageConstantsProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Material(
        child: Column(
          children: [
            TextFieldWidget(
                hinttText: "key",
                prefixxIcon: constants.personIcon,
                controller: keycontroller),
            TextFieldWidget(
                hinttText: "value",
                prefixxIcon: constants.personIcon,
                controller: valuecontroller),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
