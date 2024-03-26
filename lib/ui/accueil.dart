import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<Accueil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAF8DE7),
      appBar: AppBar(
        title: const Text('Le nombre magique', style: TextStyle(color: Colors.deepPurple),),
        backgroundColor: const Color(0xFFAF8DE7),),
      body: Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(80.0),),
              ElevatedButton(
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 40, vertical: 20)), ,
                    backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
                  ),
                  child: const Text('Jouer', style: TextStyle(color: Color(0xFFD2CCEF)),),
                  onPressed: () {  },//onPressed: () => context.go('mettre le chemin'),
              ),
              const Padding(padding: EdgeInsets.all(20.0),),
              ElevatedButton(
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 20)),
                    backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
                  ),
                  child: const Text('Voir mes scores', style: TextStyle(color: Color(0xFFD2CCEF)),),
                  onPressed: () {  },//onPressed: () => context.go('mettre le chemin'),
                //onPressed: () => context.go(''),
              ),
              const Padding(padding: EdgeInsets.all(20.0),),
              ElevatedButton(
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 20)),
                    backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
                  ),
                  child: const Text('Règles du jeu', style: TextStyle(color: Color(0xFFD2CCEF)),),
                  onPressed: () {  },//onPressed: () => context.go('mettre le chemin'),
                //onPressed: () => context.go(''),
              ),
            ],
          )
      ),
    );
  }
}
