import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/screens/home_screen.dart';

void main() {
  group('HomeScreen', () {
    testWidgets('Deve exibir o título e os botões principais', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomeScreen()));

      expect(find.text('Gerenciador de Senhas'), findsOneWidget);
      expect(find.text('Bem-vindo ao Gerenciador de Senhas!'), findsOneWidget);
      expect(find.text('Minhas Contas'), findsOneWidget);
      expect(find.text('Adicionar Conta'), findsOneWidget);
    });

    testWidgets('Deve navegar para Minhas Contas ao tocar no botão', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomeScreen(),
        routes: {'/minhasContas': (context) => Scaffold(body: Text('Minhas Contas'))},
      ));

      await tester.tap(find.text('Minhas Contas'));
      await tester.pumpAndSettle();

      expect(find.text('Minhas Contas'), findsOneWidget);
    });

    testWidgets('Deve navegar para Adicionar Conta ao tocar no botão', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomeScreen(),
        routes: {'/adicionarConta': (context) => Scaffold(body: Text('Adicionar Conta'))},
      ));

      await tester.tap(find.text('Adicionar Conta'));
      await tester.pumpAndSettle();

      expect(find.text('Adicionar Conta'), findsOneWidget);
    });
  });
}
