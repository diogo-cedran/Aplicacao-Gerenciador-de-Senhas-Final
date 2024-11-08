import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/lista_screen.dart';
import 'screens/formulario_screen.dart';

void main() {
  runApp(GeradorDeSenhasApp());
}

class GeradorDeSenhasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerador e Armazenador de Senhas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/minhasContas': (context) => ListaScreen(),
        '/adicionarConta': (context) => FormularioScreen(),
      },
    );
  }
}
