import 'dart:math';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp_mobile/sharedpref.dart';


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

  void reset(BuildContext context){
    vie = 5;
    min = 0;
    max = 10;
    nombre = generateNombre(max);
    perdu = false;
    trouve = false;
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

  Future<void> saveScore() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final score = prefs.getInt(name) ?? 0;
      if(score < difficulty){
        await prefs.setInt(name, difficulty);
      }
      print("Score enregistré avec\nnom: name \nniveau: difficulty");
    } catch (error) {
      print("ERREUR: $error");
    }
  }

  Future<void> debug() async {
    final prefs = await SharedPrefUtils.getInstance();
    // print(prefs.getString('1711817472024'));
     // print(prefs.getInt('ASA'));
    final test = await SharedPrefUtils.getAllData();
    print(test);
     // print(prefs.getKeys());
     //print(prefs.getString('5'));
  }
}
