import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';

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

class TextPage extends StatefulWidget {
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  Timer? _timer;
  int _start = 45;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => QCMPage()), // Redirect to NewPage
          );
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: _buildGradientDecoration().color,
          elevation: 0,
          flexibleSpace: Container(
            decoration: _buildGradientDecoration(),
          ),
          title: Container(
            height: 60.0,
            alignment: Alignment.center,
            child: Text('Timer: $_start'), // Display the countdown timer
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Le projet darrêté, émanant des services du secrétaire dEtat à la Mer Hervé Berville...',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}

class QCMPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QCM Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is the QCM Page',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
              },
              child: Text('Return to Main Page'),
            ),
          ],
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
  double starOpacity = 0.0; // Opacity variable for the star image

  @override
  void initState() {
    super.initState();
    _scheduleImageAppearance();
  }

  void _scheduleImageAppearance() {
    // Show the image after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        starOpacity = 1.0; // Fade in the image
      });

      // Hide the image after an additional 3 seconds
      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          starOpacity = 0.0; // Fade out the image
        });
      });
    });
  }
  // ... vos autres déclarations de variables et fonctions ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paint on Image'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Image de fond
          Image.asset(
            'assets/images/sapin.jpg',
            fit: BoxFit.cover,
            width: 600,
            height: 600,
          ),
          // Image animée (avec IgnorePointer)
          Positioned(
            child: IgnorePointer(
              child: AnimatedOpacity(
                opacity: starOpacity,
                duration: Duration(seconds: 1),
                child: Image.asset(
                  'assets/images/whatsapp.jpg',
                  alignment: Alignment(0, -1),
                  width: 800,
                  height: 800,
                ),
              ),
            ),
          ),
          // CustomPaint et GestureDetector pour le dessin
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

