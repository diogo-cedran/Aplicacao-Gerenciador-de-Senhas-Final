import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/senha_model.dart';

class ApiService {
  final String baseUrl = 'http://localhost:3000/senhas';

  Future<List<SenhaModel>> getSenhas() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => SenhaModel.fromJson(item)).toList();
    } else {
      throw Exception('Erro ao carregar senhas');
    }
  }

  Future<void> addSenha(SenhaModel senha) async {
    List<SenhaModel> senhasExistentes = await getSenhas();
    int novoId = senhasExistentes.isEmpty
        ? 1
        : senhasExistentes
            .map((s) => int.tryParse(s.id ?? '0') ?? 0)
            .reduce((a, b) => a > b ? a : b) + 1;

    senha.id = novoId.toString();

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(senha.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Erro ao adicionar a senha');
    }
  }

  Future<void> updateSenha(SenhaModel senha) async {
    final url = '$baseUrl/${senha.id}';
    final response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(senha.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao atualizar a senha');
    }
  }

  Future<void> deleteSenha(String id) async {
    final url = '$baseUrl/$id';
    final response = await http.delete(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Erro ao deletar a senha');
    }
  }
}
