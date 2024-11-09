import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/senha_model.dart';

class ApiService {
  final String baseUrl = 'http://localhost:3000/senhas';

  Future<List<SenhaModel>> getSenhas() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => SenhaModel.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar senhas');
    }
  }

  Future<void> createSenha(SenhaModel senha) async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<SenhaModel> senhasExistentes = data.map((json) => SenhaModel.fromJson(json)).toList();
      final int novoId = senhasExistentes.isNotEmpty
          ? senhasExistentes.map((s) => int.tryParse(s.id) ?? 0).reduce((a, b) => a > b ? a : b) + 1
          : 1;

      final novaSenha = senha.copyWith(id: novoId.toString());
      await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(novaSenha.toJson()),
      );
    } else {
      throw Exception('Erro ao criar senha');
    }
  }

  Future<void> deleteSenha(String id) async {
    final url = '$baseUrl/$id';
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Erro ao deletar senha');
    }
  }

  Future<void> updateSenha(SenhaModel senha) async {
    final url = '$baseUrl/${senha.id}';
    final response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(senha.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Erro ao atualizar senha');
    }
  }
}
