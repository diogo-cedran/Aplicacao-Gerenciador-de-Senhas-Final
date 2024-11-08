import 'package:flutter/material.dart';
import '../models/senha_model.dart';
import '../services/api_service.dart';
import '../components/senha_card.dart';
import 'formulario_screen.dart';

class ListaScreen extends StatefulWidget {
  @override
  _ListaScreenState createState() => _ListaScreenState();
}

class _ListaScreenState extends State<ListaScreen> {
  late ApiService _apiService;
  List<SenhaModel> _senhas = [];

  @override
  void initState() {
    super.initState();
    _apiService = ApiService();
    _loadSenhas();
  }

  Future<void> _loadSenhas() async {
    final senhas = await _apiService.getSenhas();
    setState(() {
      _senhas = senhas;
    });
  }

  void _deleteSenha(String id) async {
    await _apiService.deleteSenha(id);
    _loadSenhas();
  }

  void _editSenha(SenhaModel senha) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormularioScreen(senha: senha),
      ),
    );
    _loadSenhas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Contas"),
      ),
      body: _senhas.isEmpty
          ? Center(child: Text("Nenhuma conta encontrada."))
          : ListView.builder(
              itemCount: _senhas.length,
              itemBuilder: (context, index) {
                final senha = _senhas[index];
                return SenhaCard(
                  senha: senha,
                  onEdit: () => _editSenha(senha),
                  onDelete: () => _deleteSenha(senha.id),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormularioScreen()),
          );
          _loadSenhas();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
