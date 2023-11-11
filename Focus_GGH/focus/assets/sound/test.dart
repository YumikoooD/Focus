// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyWidget extends StatefulWidget {
//   @override
//   _MyWidgetState createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   final audioPlayer = AudioPlayer();
//   Timer? timer;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   Future<void> playSound(String path) async {
//     timer?.cancel();
//     timer = Timer.periodic(Duration(seconds: 5), (Timer t) async {
//       await audioPlayer.play(AssetSource(path));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         playSound('sound/twitter.mp3');
//       },
//       child: Text('Play Sound'),
//     );
//   }
// }

// BoxDecoration _buildGradientDecoration() {
//   return BoxDecoration(
//     gradient: LinearGradient(
//       begin: Alignment.topRight,
//       end: Alignment.bottomLeft,
//       colors: [Colors.white, Colors.purple[300]!],
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         fontFamily: 'Roboto',
//         primarySwatch: Colors.purple,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class TextPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(kToolbarHeight),
//         child: AppBar(
//           backgroundColor: _buildGradientDecoration().color,
//           elevation: 0,
//           flexibleSpace: Container(
//             decoration: _buildGradientDecoration(),
//           ),
//           title: Container(
//             height: 60.0,
//             alignment: Alignment.center,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Text(
//           'Votre texte ici...',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 16.0,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 170, 117, 190),
//         elevation: 0,
//         title: Center(
//           child: Container(
//             height: 60.0,
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: _buildGradientDecoration(),
//         child: Center(
//           child: MyWidget(), // Utilisation de votre widget personnalisé
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.purple[300],
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.purple[100],
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Business',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'School',
//           ),
//         ],
//       ),
//     );
//   }
// }
