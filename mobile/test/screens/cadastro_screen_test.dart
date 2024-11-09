import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/screens/cadastro_screen.dart';

void main() {
  group('CadastroScreen', () {
    testWidgets('Deve exibir os campos e o botão de cadastro', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CadastroScreen()));

      expect(find.text('Nome Completo'), findsOneWidget);
      expect(find.text('E-mail'), findsOneWidget);
      expect(find.text('Senha'), findsOneWidget);
      expect(find.text('Cadastrar'), findsOneWidget);
    });

    testWidgets('Deve mostrar mensagem de erro ao falhar no cadastro', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CadastroScreen()));

      await tester.enterText(find.byType(TextFormField).at(0), 'Nome Teste');
      await tester.enterText(find.byType(TextFormField).at(1), 'email@teste.com');
      await tester.enterText(find.byType(TextFormField).at(2), 'senha123');
      await tester.tap(find.text('Cadastrar'));
      await tester.pump();

      expect(find.text('Erro ao cadastrar. Tente novamente.'), findsOneWidget);
    });
  });
}
