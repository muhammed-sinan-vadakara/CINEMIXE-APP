// import 'package:cinemixe/core/contants/home/homepage_constants.dart';
// import 'package:cinemixe/core/widgets/text_flied.dart';
// import 'package:cinemixe/feactures/home/presentation/providers/home_apiservice_provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class FavaritePage extends HookConsumerWidget {
//   static const routePath = "/favarite";
//   const FavaritePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     final user = <String, dynamic>{"test": 200};
//     db.collection("user").add(user).then((DocumentReference doc) {});
//     // print("DocumentSnapshot added with ID: ${doc.id}"));
//     // final storage = FirebaseStorage.instance;

//     final keycontroller = useTextEditingController();
//     final valuecontroller = useTextEditingController();
//     final constants = ref.watch(homePageConstantsProvider);
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Favarite"),
//           centerTitle: true,
//         ),
//         body: GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: StreamBuilder(
//               stream: ref.read(homeApiServiceProvider.notifier).getAllMovies(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return GridViewWidget(
//                     entity: snapshot.data!,
//                   );
//                 } else if (snapshot.hasError) {
//                   return TextButton(
//                     onPressed: () {},
//                     child: const Text('Retry'),
//                   );
//                 } else {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//               }),
//         ),
//         bottomNavigationBar: Container());
//   }
// }
