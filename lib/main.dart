import 'package:flutter/material.dart';
import 'package:practica_2/src/screens/agregar_nota_screen.dart';
import 'package:practica_2/src/screens/intenciones_screen.dart';
import 'package:practica_2/src/screens/login_screen.dart';
import 'package:practica_2/src/screens/notas_screen.dart';
import 'package:practica_2/src/screens/profile_screen.dart';
import 'package:practica_2/src/screens/splash_screen.dart';

import 'src/screens/opcion1_screen.dart';
import 'src/screens/opcion2_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/opc1' : (BuildContext context) => Opcion1Screen(),
       '/opc2' : (BuildContext context) => Opcion2Screen(),
        '/intenciones' : (BuildContext context) => IntencionesScreen(),
        '/notas' : (BuildContext context) => NotasScreen(),
        '/agregar' : (BuildContext context) => AgregarNotaScreen(),
        '/perfil' : (BuildContext context) => ProfileScreen(),

      },
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
    );
  }
}