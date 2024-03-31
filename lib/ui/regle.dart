import 'package:flutter/material.dart';

class PageRegles extends StatelessWidget {
  const PageRegles({super.key});

  @override
  Widget build(BuildContext context) {
    final titreStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      backgroundColor: const Color(0xFF243B57),
      appBar: AppBar(
        title: Text('RÈGLE DU JEU',
          style: TextStyle(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.bold)
          ,),
        backgroundColor: const Color(0xFF969696),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xFFD6D6D6),
              ),
              width: 300,
              height: 500,
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Text(
                    "But du jeu",
                    style: titreStyle,
                  ),
                  Text(
                    "Deviner un nombre magique aléatoire entre deux bornes."
                  ),
                  Spacer(),
                  Text(
                    "Déroulement du jeu",
                    style: titreStyle,
                  ),
                  Text(
                    "- Niveau 1: Le nombre magique est compris entre 0 et 10. Le joueur a 5 vies."
                  ),
                  Text(
                    "- Deviner le nombre: Le joueur propose un nombre"
                  ),
                  Text(
                    "- Perdre une vie: Le joueur propose un nombre incorrect."
                  ),
                  Text(
                    "- Gagner un niveau: Le joueur trouve le nombre magique."
                  ),
                  Text(
                    "- Le niveau suivant augmente de 10 (20 pour le niveau 2, etc.) et le nombre de vies du joueur est réinitialisé à 5."
                  ),
                  Spacer(),
                  Text(
                    "Amusez-vous!",
                    style: titreStyle,
                  )
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }

}
