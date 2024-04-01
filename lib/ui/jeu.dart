import 'package:flutter/material.dart';
import '../models/partie.dart';

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
      const BorderSide(color: Colors.black, width: 1.0),
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
        partie.max = rep-1;
      }else if(rep < partie.nombre){
        message = 'Le nombre magique est plus grand que $rep';
        partie.min = rep+1;
      }
    });
  }

  void _lancer(){
    setState(() {
      partie.difficulty = 1;
      partie.reset(context);
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
    partie.saveScore();
    return pagePerdu(context);
  }

  Scaffold pageNom(BuildContext context){
    final prenomController = TextEditingController();
    return Scaffold(
        backgroundColor: const Color(0xFF243B57),
        appBar: AppBar(
          backgroundColor: const Color(0xFF969696),),
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
                          style: commonButtonStyle,
                          child: const Text("Continuer"),
                        ),
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
              margin: const EdgeInsets.all(20),
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
                    style: const TextStyle(color: Colors.white),
                  ),
                  ElevatedButton(
                      style: commonButtonStyle,
                      onPressed: () {
                        try{
                          var repInt = int.tryParse(reponseController.text);
                          if((repInt!<=partie.max) && (repInt>=partie.min)){
                            _tentative(context, repInt);
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Le chiffre doit être compris entre ${partie.min} et ${partie.max}'))
                            );
                          }
                        }catch(e){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('La réponse doit être un entier'))
                          );
                        }
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
                      child: const Text('Continuer'),
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
              child: Text(
                  'Vous avez perdu\nLa réponse était ${partie.nombre}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 50,
                  )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    _lancer();
                  },
                  child: const Icon(Icons.replay),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.home),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
