import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cinemixe_app/feactures/authenthication/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class Splash1 extends StatefulWidget {
  static const routePath = '/splashscreen';
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // label: 'TextLiquidFill',
        // color: Colors.white,
        child: TextLiquidFill(
          waveDuration: const Duration(seconds: 1),
          loadDuration: const Duration(seconds: 5),
          text: 'COUNTER APP',
          waveColor: Colors.blueAccent,
          boxBackgroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
          boxHeight: 300,
        ),
      ),
    );
  }
}

// Column(
//   children: [
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(1),
//         child: Container(
//           width: MediaQuery.sizeOf(context).width,
//           height: MediaQuery.sizeOf(context).height / 2.5,
//           color: const Color.fromARGB(255, 42, 47, 51),
//           child: ListView.builder(
//             itemCount: value.length,
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: InkWell(
//                     onTap: () {
//                       // context.push(homea.routePath,
//                       //     extra: (HomeApiServiceEntity));
//                     },
//                     child: Container(
//                       height: 100,
//                       color: Colors.grey.shade800,
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Image.network(
//                               '$imagePath${value[index].posterPath}',
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 150,
//                             child: Center(
//                               child: Text(
//                                 value[index].title,
//                                 style: const TextStyle(
//                                     color: Colors.white),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     ),
//     Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: Container(
//             width: double.infinity,
//             height: 400,
//             color: const Color.fromARGB(255, 17, 6, 6),
//             child: ListView.builder(
//               itemCount: value.length,
//               shrinkWrap: true,
//               // scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: InkWell(
//                       onTap: () {
//                         // context.push(MyHerp.routePath,
//                         //     extra: (MovieEntity));
//                       },
//                       child: Container(
//                         height: 300,
//                         width: 200,
//                         color: Colors.grey.shade800,
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               width: 300,
//                               height: 200,
//                               child: ClipRRect(
//                                 borderRadius:
//                                     BorderRadius.circular(10),
//                                 child: Image.network(
//                                   '$imagePath${value[index].posterPath}',
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             SizedBox(
//                               width: 250,
//                               child: Center(
//                                 child: Text(
//                                   value[index].title,
//                                   style: const TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 19),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ))
//   ],
// ),
