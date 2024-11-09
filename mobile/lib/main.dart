import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/cadastro_screen.dart';
import 'screens/home_screen.dart';
import 'screens/lista_screen.dart';
import 'screens/formulario_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gerenciador de Senhas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/cadastro': (context) => CadastroScreen(),
        '/home': (context) => HomeScreen(),
        '/minhasContas': (context) => ListaScreen(),
        '/adicionarConta': (context) => FormularioScreen(),
      },
    );
  }
}
