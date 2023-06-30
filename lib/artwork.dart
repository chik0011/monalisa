import 'package:flutter/material.dart';

class _ArtworkState extends State<Artwork> {
  bool _isFavorite = false;
  bool _showDescription = false;

  void changeIsFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  void changeShowDescription() {
    setState(() {
      _showDescription = !_showDescription;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Museum"),
          backgroundColor: Colors.brown,
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset('images/Mona_Lisa.jpg'),
                ),
                Container(
                  height: 600,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.favorite,
                    size: 100.0,
                    color: (_isFavorite == false
                        ? Colors.white.withOpacity(0.75)
                        : Colors.red.withOpacity(1)),
                  ),
                ),
                Container(
                    height: 400,
                    width: 450,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Visibility(
                            visible: _showDescription,
                            child: const Center(
                              child: Text(
                                """La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé
entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu'à 1517 (l'artiste étant mort
le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa
Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à
l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à
Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci.
La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre
d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par
ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau
l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout
cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au
monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le
diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier
quotidiennement.
""",
                                style: TextStyle(
                                  fontFamily: 'Merriweather',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ))
              ],
            ),
            const Text(
              "Mona Lisa",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Merriweather',
                  color: Colors.brown),
            ),
            const Text(
              "Léonard De Vinci",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Merriweather',
                  color: Colors.brown),
            ),
          ],
        ),
        floatingActionButton: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 31),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    changeIsFavorite();
                    final snackBar = SnackBar(
                      content: const Text('Oeuvre ajoutée à vos favoris'),
                      action: SnackBarAction(
                        label: 'Message',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );

                    if (_isFavorite) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.favorite,
                    color: (_isFavorite == false
                        ? Colors.white.withOpacity(0.75)
                        : Colors.red.withOpacity(1)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 31),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  onPressed: () {
                    changeShowDescription();
                  },
                  child: const Icon(Icons.article),
                ),
              ),
            )
          ],
        ));
  }
}

class Artwork extends StatefulWidget {
  const Artwork({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ArtworkState();
  }
}
