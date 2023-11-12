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
  int _start = 25;
  double imageOpacity = 0.0; // Opacity variable for the image

  @override
  void initState() {
    super.initState();
    startTimer();
    _scheduleImageAppearance();
  }

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
            MaterialPageRoute(builder: (context) => QCMPage()),
          );
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void _scheduleImageAppearance() {
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        imageOpacity = 1.0; // Fade in the image
      });

      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          imageOpacity = 0.0; // Fade out the image
        });
      });
    });
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
          // backgroundColor and other properties...
          title: Container(
            height: 60.0,
            alignment: Alignment.center,
            child: Text('Timer: $_start'), // Display the countdown timer
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Dans la petite ville de Valoria, cachée parmi les montagnes, un mystère ancien et oublié sommeillait. Élise, une jeune détective amatrice, était fascinée par les légendes urbaines et les histoires non résolues. Un jour, en explorant le grenier de sa grand-mère, elle trouva une vieille carte marquée d un "X" près d une structure inconnue au bord du lac. Poussée par la curiosité, Élise décida d enquêter. Elle se rendit au lac et découvrit une entrée secrète menant à des tunnels souterrains. Là, elle trouva des indices sur une société secrète qui aurait existé il y a des siècles, gardienne d un trésor inestimable. Alors qu elle progressait, elle rencontra Marc, un historien local, qui cherchait également à percer le secret de ces tunnels. Ensemble, ils déchiffrèrent des énigmes complexes et évitèrent de nombreux pièges. Finalement, ils arrivèrent à une grande salle où reposait un artefact ancien, le "Cœur de Valoria", censé apporter la paix et la prospérité à la ville. Cependant, leur découverte attira l attention d un groupe de voleurs. Élise et Marc durent alors élaborer un plan astucieux pour protéger l artefact et le restituer en toute sécurité à la ville.',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Positioned(
            child: AnimatedOpacity(
              opacity: imageOpacity,
              duration: Duration(seconds: 1),
              child: Image.asset(
                'assets/images/snapune.jpg', // Replace with your image asset
                width: 600, // Adjust size as needed
                height: 600,
                alignment: Alignment(0, -1),
              ),
            ),
          ),
        ],
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
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[300],
                  foregroundColor: Colors.white,
                ),
                child: Text('Go to Loading Page'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoadingPage()),
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

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver {
  bool _showFocusMessage = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      setState(() {
        _showFocusMessage = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 20),
            if (_showFocusMessage)
              Text('FOCUS!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
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
  Timer? _refreshTimer;

  @override
  void initState() {
    super.initState();
    _scheduleImageAppearance();
    _startRefreshTimer();
  }

  void _startRefreshTimer() {
    _refreshTimer = Timer(Duration(seconds: 10), () {
      setState(() {
        // Cette ligne va reconstruire le widget, simulant un rafraîchissement
        points = []; // Réinitialiser les points ou ajuster selon le besoin
      });
      // Si vous voulez naviguer à nouveau vers la même page, utilisez :
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => PaintScreen()));
    });
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
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

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
              "\tQCM : Le Secret de la Ville Endormie\n\tQuel était l'objet trouvé par Élise dans le grenier de sa grand-mère ?\n\ta) Une vieille montre\n\tb) Une carte mystérieuse\n\tc) Un livre ancien\n\td) Une lettre cachetée\n\n",
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QCMPage1()),
                  );
              },
              child: Text('Next question'),
            ),
          ],
        ),
      ),
    );
  }
}

class QCMPage1 extends StatelessWidget {
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
              "\tQu'a découvert Élise au bord du lac ?\n\ta) Un château abandonné\n\tb) Une cabane de pêcheur\n\tc) Une entrée secrète\n\td) Un bateau naufragé\n\n",
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QCMPage2()),
                  );
              },
              child: Text('Next question'),
            ),
          ],
        ),
      ),
    );
  }
}

class QCMPage2 extends StatelessWidget {
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
              "\tQui Élise a-t-elle rencontré dans les tunnels ?\n\ta) Un gardien mystérieux\n\tb) Un voleur\n\tc) Un historien local\n\td) Un fantôme\n\n",
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QCMPage3()),
                  );
              },
              child: Text('Next question'),
            ),
          ],
        ),
      ),
    );
  }
}

class QCMPage3 extends StatelessWidget {
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
              "\tQuel est le nom de l'artefact trouvé dans la grande salle ?\n\ta) Le Diamant de Valoria\n\tb) L'Épée de Valoria\n\tc) Le Cœur de Valoria\n\td) Le Sceptre de Valoria\n\n",
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QCMPage4()),
                  );
              },
              child: Text('Last question'),
            ),
          ],
        ),
      ),
    );
  }
}

class QCMPage4 extends StatelessWidget {
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
              "\tQuel était le principal danger après la découverte de l'artefact ?\n\ta) Un effondrement du tunnel\n\tb) L'attaque d'un animal sauvage\n\tc) L'arrivée d'un groupe de voleurs\n\td) Une malédiction ancienne\n",
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
