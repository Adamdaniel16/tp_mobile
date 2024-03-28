import 'dart:math';

import 'package:flutter/material.dart';

class Partie {
  late int vie;
  late int nombre;
  late int difficulty;
  late bool perdu;
  late bool trouve;
  late String name;
  late int min;
  late int max;

  Partie(this.difficulty){
    vie = 5;
    min = 0;
    max = 10;
    nombre = generateNombre(max);
    perdu = false;
    trouve = false;
  }

  bool estPerdu(){
    return vie == 0;
  }

  void tentative(BuildContext context, int rep){
    vie--;
    if(rep == nombre){
      trouve = true;
    }
  }

  void incrementNiv(BuildContext context){
    vie = 5;
    difficulty++;
    max = 10*difficulty;
    nombre = generateNombre(max);
    trouve = false;
  }

  int generateNombre(int max) {
    final random = Random();
    return random.nextInt(max+1);
  }
}

class PageJeu extends StatefulWidget {
  final Partie? partie;

  const PageJeu({super.key, this.partie});
  @override
  State<PageJeu> createState() => _PageJeuState();
}

class _PageJeuState extends State<PageJeu> {
  late Partie partie;
  late String message;

  final commonButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    side: MaterialStateProperty.all<BorderSide>(
      BorderSide(color: Colors.black, width: 1.0),
    ),
  );

  final boxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(20.0),
  color: const Color(0xFFD6D6D6),
  );

  void _tentative(BuildContext context, int rep){
    setState(() {
      partie.tentative(context, rep);
      if(rep > partie.nombre){
        message = 'Le nombre magique est plus petit que $rep';
      }else if(rep < partie.nombre){
        message = 'Le nombre magique est plus grand que $rep';
      }
    });
  }

  void _lancer(){
    setState(() {
      partie.difficulty++;
    });
  }

  void _incrementNiv(){
    setState(() {
      partie.incrementNiv(context);
    });
  }

  @override
  void initState() {
    super.initState();
    partie = Partie(0);
  }

  @override
  Widget build(BuildContext context) {
    if(partie.vie == 5){
      message = 'Chiffre entre ${partie.min} et ${partie.max}';
    }
    if(partie.difficulty == 0){
      return pageNom(context);
    }
    if(partie.trouve){
      return pageGagnee(context);
    }
    if(partie.vie>0){
      return pageJouer(context);
    }
    return pagePerdu(context);
  }

  Scaffold pageNom(BuildContext context){
    final prenomController = TextEditingController();
    return Scaffold(
        backgroundColor: const Color(0xFF243B57),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    decoration: boxDecoration,
                    width: 300,
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: prenomController,
                          decoration: const InputDecoration(
                            labelText: "Prénom",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Prénom est obligatoire.'; // Clear and concise error message
                            }
                            return null; // No error if input is valid
                          },
                        ),
                        ElevatedButton(
                            onPressed: () {
                              partie.name = prenomController.text;
                              _lancer();
                            },
                            child: const Text("Continuer"),
                            style: commonButtonStyle,
                        )
                      ],
                    )
                ),
              ],
            )
        )
    );
  }

  Scaffold pageJouer(BuildContext context){
    final reponseController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFF243B57),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Niveau ${partie.difficulty}',
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white
                      )
                  ),
                  Row(
                    children: [
                      Image.asset('images/<3.png'),
                      Text('x${partie.vie}',style: const TextStyle(fontSize: 25, color: Colors.white))
                    ],
                  )
                ],
              ),
            ),
            Container(
                decoration: boxDecoration,
                width: 350,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                        message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 50,
                        )),
                  ],
                )
            ),
            Container(
              width: 300,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: reponseController,
                    decoration: const InputDecoration(
                      labelText: "Réponse",
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  ElevatedButton(
                    style: commonButtonStyle,
                    onPressed: () {
                      var repInt = int.tryParse(reponseController.text);
                      _tentative(context, repInt!);
                    },
                    child: const Text("Submit"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold pageGagnee(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFF243B57),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.lightGreen,
              ),
              width: 350,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                      'Vous avez trouvé la réponse:\n${partie.nombre}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 50,
                      )),
                  ElevatedButton(
                    style: commonButtonStyle,
                    onPressed: (){
                      _incrementNiv();
                    },
                    child: Text('Continuer'),
                      ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }

  Scaffold pagePerdu(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFF243B57),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.redAccent,
                ),
                width: 350,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                        'Vous avez perdu\nLa réponse était ${partie.nombre}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 50,
                        )),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
