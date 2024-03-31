import 'package:flutter/material.dart';
import 'package:tp_mobile/ui/accueil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD9D9D9)),
        useMaterial3: true,
        fontFamily: 'IrishGrover',
      ),
      home: const Accueil(),
    );
  }
}
