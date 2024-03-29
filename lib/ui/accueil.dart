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
      backgroundColor: const Color(0xFF243B57),
      appBar: AppBar(
        title: const Center(child: Text('LE NOMBRE MAGIQUE', style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),),),
        backgroundColor: const Color(0xFF969696),),
      body: Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(80.0),),
              ElevatedButton(
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
                    backgroundColor: MaterialStatePropertyAll(Color(0xFFD9D9D9)),
                  ),
                  child: const Text('Jouer', style: TextStyle(color: Colors.black, fontSize: 20), ),
                  onPressed: () {  },//onPressed: () => context.go('mettre le chemin'),
              ),
              const Padding(padding: EdgeInsets.all(20.0),),
              ElevatedButton(
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
                    backgroundColor: MaterialStatePropertyAll(Color(0xFFD9D9D9)),
                  ),
                  child: const Text('Voir mes scores', style: TextStyle(color: Colors.black, fontSize: 20),),
                  onPressed: () {  },//onPressed: () => context.go('mettre le chemin'),
                //onPressed: () => context.go(''),
              ),
              const Padding(padding: EdgeInsets.all(20.0),),
              ElevatedButton(
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 40, vertical: 20)),
                    backgroundColor: MaterialStatePropertyAll(Color(0xFFD9D9D9)),
                  ),
                  child: const Text('Règles du jeu', style: TextStyle(color: Colors.black, fontSize: 20),),
                  onPressed: () {  },//onPressed: () => context.go('mettre le chemin'),
                //onPressed: () => context.go(''),
              ),
            ],
          )
      ),
    );
  }
}
