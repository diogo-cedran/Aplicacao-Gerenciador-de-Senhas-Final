import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/services/api_service.dart';
import 'package:mobile/models/senha_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'api_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ApiService apiService;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    apiService = ApiService();
  });

  group('ApiService', () {
    test('deve retornar uma lista de senhas ao chamar getSenhas', () async {
      final mockResponse = jsonEncode([
        {
          'id': '1',
          'descricao': 'Senha 1',
          'usuario': 'user1',
          'valor': 'valor1',
        },
        {
          'id': '2',
          'descricao': 'Senha 2',
          'usuario': 'user2',
          'valor': 'valor2',
        }
      ]);

      when(mockClient.get(Uri.parse(apiService.baseUrl)))
          .thenAnswer((_) async => http.Response(mockResponse, 200));

      final senhas = await apiService.getSenhas();

      expect(senhas.length, 2);
      expect(senhas[0].id, '1');
      expect(senhas[0].descricao, 'Senha 1');
    });

    test('deve lançar uma exceção ao falhar no getSenhas', () async {
      when(mockClient.get(Uri.parse(apiService.baseUrl)))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(apiService.getSenhas(), throwsException);
    });

    test('deve criar uma nova senha ao chamar createSenha', () async {
      final senha = SenhaModel(id: '3', descricao: 'Senha 3', usuario: 'user3', valor: 'valor3');
      final mockResponse = jsonEncode({
        'id': '3',
        'descricao': 'Senha 3',
        'usuario': 'user3',
        'valor': 'valor3',
      });

      when(mockClient.post(
        Uri.parse(apiService.baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(senha.toJson()),
      )).thenAnswer((_) async => http.Response(mockResponse, 201));

      await apiService.createSenha(senha);

      verify(mockClient.post(
        Uri.parse(apiService.baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(senha.toJson()),
      )).called(1);
    });

    test('deve deletar uma senha ao chamar deleteSenha', () async {
      final senhaId = '3';
      when(mockClient.delete(Uri.parse('${apiService.baseUrl}/$senhaId')))
          .thenAnswer((_) async => http.Response('', 200));

      await apiService.deleteSenha(senhaId);

      verify(mockClient.delete(Uri.parse('${apiService.baseUrl}/$senhaId'))).called(1);
    });

    test('deve atualizar uma senha ao chamar updateSenha', () async {
      final senha = SenhaModel(id: '3', descricao: 'Senha Atualizada', usuario: 'user3', valor: 'valorAtualizado');
      when(mockClient.put(
        Uri.parse('${apiService.baseUrl}/${senha.id}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(senha.toJson()),
      )).thenAnswer((_) async => http.Response('', 200));

      await apiService.updateSenha(senha);

      verify(mockClient.put(
        Uri.parse('${apiService.baseUrl}/${senha.id}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(senha.toJson()),
      )).called(1);
    });
  });
}
