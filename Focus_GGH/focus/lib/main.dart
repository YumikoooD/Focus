import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Plus petit, je revvais d\'en avoir un comme animal de compagnie. Mais je me suis rendu compte que c\'était impossible. En effet, les dauphins sont des animaux sauvages et ils ne peuvent pas vivre en captivité. Ils ont besoin de beaucoup d\'espace pour nager et de beaucoup de nourriture. Ils sont aussi très sensibles au bruit et à la pollution. Ils ne peuvent pas vivre dans un aquarium. LEs dauphins sont des animaux marins, ils sont très intelligents et très sociables. Plus petit, je revvais d\'en avoir un comme animal de compagnie. Mais je me suis rendu compte que c\'était impossible. En effet, les dauphins sont des animaux sauvages et ils ne peuvent pas vivre en captivité. Ils ont besoin de beaucoup d\'espace pour nager et de beaucoup de nourriture. Ils sont aussi très sensibles au bruit et à la pollution. Ils ne peuvent pas vivre dans un aquarium. LEs dauphins sont des animaux marins, ils sont très intelligents et très sociables. Plus petit, je revvais d\'en avoir un comme animal de compagnie. Mais je me suis rendu compte que c\'était impossible. En effet, les dauphins sont des animaux sauvages et ils ne peuvent pas vivre en captivité. Ils ont besoin de beaucoup d\'espace pour nager et de beaucoup de nourriture. Ils sont aussi très sensibles au bruit et à la pollution. Ils ne peuvent pas vivre dans un aquarium. LEs dauphins sont des animaux marins, ils sont très intelligents et très sociables. Plus petit, je revvais d\'en avoir un comme animal de compagnie. Mais je me suis rendu compte que c\'était impossible. En effet, les dauphins sont des animaux sauvages et ils ne peuvent pas vivre en captivité. Ils ont besoin de beaucoup d\'espace pour nager et de beaucoup de nourriture. Ils sont aussi très sensibles au bruit et à la pollution. Ils ne peuvent pas vivre dans un aquarium. LEs dauphins sont des animaux marins, ils sont très intelligents et très sociables. Plus petit, je revvais d\'en avoir un comme animal de compagnie. Mais je me suis rendu compte que c\'était impossible. En effet, les dauphins sont des animaux sauvages et ils ne peuvent pas vivre en captivité. Ils ont besoin de beaucoup d\'espace pour nager et de beaucoup de nourriture. Ils sont aussi très sensibles au bruit et à la pollution. Ils ne peuvent pas vivre dans un aquarium.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
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
        backgroundColor: Colors.transparent,
        elevation: 0, // Aucune ombre
        title: Center(
          child: Container(
            height: 60.0,
            child: Image.asset('assets/images/Logo_Focus.png', fit: BoxFit.contain),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.white, Colors.purple[300]!], // Gradient plus doux
          ),
        ),
        child: Center(
          child: Hero(
            tag: 'hero',
            child: Card(
              elevation: 5, // Légère ombre pour le card
              margin: EdgeInsets.all(16), // Espacement autour du card
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.purple[800]),
                title: Text(
                  'Hello, World!',
                  style: TextStyle(
                    color: Colors.purple[800],
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold, // Texte en gras
                  ),
                ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // Couleur du bouton
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
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixe le bar
        backgroundColor: Colors.purple,
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
