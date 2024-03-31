import 'package:flutter/material.dart';
import 'package:tp_mobile/ui/regle.dart';
import 'package:tp_mobile/ui/scores.dart';

import 'jeu.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<Accueil> {
  ButtonStyle buttonStyle = const ButtonStyle(
  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
  backgroundColor: MaterialStatePropertyAll(Color(0xFFD9D9D9)),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF243B57),
      appBar: AppBar(
        title: const Center(
          child: Text('LE NOMBRE MAGIQUE',
            style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold)
            ,)
          ,),
        backgroundColor: const Color(0xFF969696),),
      body: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/fond.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: buttonStyle,
                child: const Text('Jouer', style: TextStyle(color: Colors.black, fontSize: 20), ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageJeu()
                      )
                  );
                },
            ),
            const Padding(padding: EdgeInsets.all(20.0),),
            ElevatedButton(
                style: buttonStyle,
                child: const Text('Voir les scores', style: TextStyle(color: Colors.black, fontSize: 20),),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageScores()
                      )
                  );
                },
            ),
            const Padding(padding: EdgeInsets.all(20.0),),
            ElevatedButton(
                style: buttonStyle,
                child: const Text('Règles du jeu', style: TextStyle(color: Colors.black, fontSize: 20),),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageRegles(),
                      )
                  );
                },
            ),
          ],
        )
      ),
      )
    );
  }
}
