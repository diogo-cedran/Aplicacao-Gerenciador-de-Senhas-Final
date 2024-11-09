import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/screens/login_screen.dart';

void main() {
  group('LoginScreen', () {
    testWidgets('Deve exibir campos de e-mail e senha e o botão de login', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      expect(find.text('E-mail'), findsOneWidget);
      expect(find.text('Senha'), findsOneWidget);
      expect(find.text('Entrar'), findsOneWidget);
      expect(find.text('Criar nova conta'), findsOneWidget);
    });

    testWidgets('Deve navegar para a tela Home ao fazer login', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginScreen(),
        routes: {'/home': (context) => Scaffold(body: Text('Home'))},
      ));

      await tester.enterText(find.byType(TextField).at(0), 'email@teste.com');
      await tester.enterText(find.byType(TextField).at(1), 'senha123');
      await tester.tap(find.text('Entrar'));
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
    });

    testWidgets('Deve navegar para a tela de Cadastro ao clicar em Criar nova conta', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginScreen(),
        routes: {'/cadastro': (context) => Scaffold(body: Text('Cadastro'))},
      ));

      await tester.tap(find.text('Criar nova conta'));
      await tester.pumpAndSettle();

      expect(find.text('Cadastro'), findsOneWidget);
    });
  });
}
