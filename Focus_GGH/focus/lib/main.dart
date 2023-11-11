import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 170, 117, 190),
        elevation: 0, // Aucune ombre
        title: Center(
          child: Container(
            height: 60.0,
            child: Image.asset('assets/images/Logo_Focus.png',
                fit: BoxFit.contain),
          ),
        ),
      ),
      body: Container(
        decoration: _buildGradientDecoration(), // Utilisez le dégradé ici
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Hero(
                tag: 'hero',
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[300], // Couleur du bouton
                    foregroundColor: Colors.white, // Couleur du texte du bouton
                  ),
                  child: Text('Focus!'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TextPage()),
                    );
                  },
                ),
              ),
              SizedBox(height: 20), // Ajoute un espace entre les boutons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[300], // Couleur du bouton pour Paint
                  foregroundColor: Colors.white, // Couleur du texte du bouton
                ),
                child: Text('Go to Paint'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaintScreen()), // Naviguer vers la page Paint
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixe le bar
        backgroundColor: Colors.purple[300],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.purple[100],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  List<Offset?> points; // Allow null values in the points list

  MyPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint); // Use ! to assert that the value is not null
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


class PaintScreen extends StatefulWidget {
  @override
  _PaintScreenState createState() => _PaintScreenState();
}

class _PaintScreenState extends State<PaintScreen> {
  List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paint on Image'),
      ),
      body: Stack(
        alignment: Alignment.center, // Center the image
        children: <Widget>[
          // Image Layer
          Image.asset(
            'assets/images/sapin.jpg',
            fit: BoxFit.cover, // This ensures the image covers the screen, adjust as needed
            width: 600, // Stretch to the full width
            height: 600, // Stretch to the full height
          ),
          // Painting Canvas Layer
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                RenderBox renderBox = context.findRenderObject() as RenderBox;
                points.add(renderBox.globalToLocal(details.localPosition));
              });
            },
            onPanEnd: (details) {
              setState(() {
                points.add(null);
              });
            },
            child: CustomPaint(
              painter: MyPainter(points: points),
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
}

