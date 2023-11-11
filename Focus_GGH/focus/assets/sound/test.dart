import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final audioPlayer = AudioPlayer();

  Future<void> playSound(String path) async {
    await audioPlayer.play(AssetSource(path));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        playSound('assets/audio/twitter.mp3');
      },
      child: Text('Play Sound'),
    );
  }
}

BoxDecoration _buildGradientDecoration() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [Colors.white, Colors.purple[300]!],
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(kToolbarHeight), // Taille standard de la AppBar
        child: AppBar(
          backgroundColor: _buildGradientDecoration().color,
          elevation: 0,
          flexibleSpace: Container(
            decoration: _buildGradientDecoration(),
          ),
          title: Container(
            height: 60.0,
            alignment: Alignment.center,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Le projet darrêté, émanant des services du secrétaire dEtat à la Mer Hervé Berville, affirme que les systèmes de caméras "sont susceptibles dapporter une contribution significative" à la lutte contre les captures accidentelles. "La visibilité apportée aux professionnels de la pêche sur plusieurs années est un facteur déterminant de leur engagement à s’équiper en dispositifs techniques de sélectivité", estime le texte.Le projet darrêté, émanant des services du secrétaire dEtat à la Mer Hervé Berville, affirme que les systèmes de caméras "sont susceptibles dapporter une contribution significative" à la lutte contre les captures accidentelles. "La visibilité apportée aux professionnels de la pêche sur plusieurs années est un facteur déterminant de leur engagement à séquiper en dispositifs techniques ou en système dobservation électronique à distance", justifie encore le texte dans son préambule. La période de fermeture envisagée ne concerne pas le golfe du Morbihan ni le bassin dArcachon.Le projet darrêté, émanant des services du secrétaire dEtat',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final audioPlayer = AudioPlayer();

  Future<void> playSound() async {
    try {
      await audioPlayer.play(AssetSource('/audio/twitter.mp3'));
    } catch (e) {
      // Gérer l'erreur si nécessaire
      print("Erreur lors de la lecture du son: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Configuration de votre AppBar...
          ),
      body: Container(
        // Configuration de votre Body...
        child: Center(
          child: Hero(
            tag: 'hero',
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[300],
                foregroundColor: Colors.white,
              ),
              child: Text('Focus!'),
              onPressed: () {
                playSound(); // Jouer le son
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TextPage()),
                );
              },
            ),
          ),
        ),
      ),
      // Configuration de votre BottomNavigationBar...
    );
  }
}
