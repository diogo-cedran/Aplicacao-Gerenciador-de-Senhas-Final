import 'package:flutter/material.dart';
import '../models/senha_model.dart';
import '../services/api_service.dart';
import 'formulario_screen.dart';

class ListaScreen extends StatefulWidget {
  @override
  _ListaScreenState createState() => _ListaScreenState();
}

class _ListaScreenState extends State<ListaScreen> {
  final ApiService _apiService = ApiService();
  List<SenhaModel> _senhas = [];

  @override
  void initState() {
    super.initState();
    _carregarSenhas();
  }

  void _carregarSenhas() async {
    final senhas = await _apiService.getSenhas();
    setState(() {
      _senhas = senhas;
    });
  }

  void _deleteSenha(String id) async {
    await _apiService.deleteSenha(id);
    _carregarSenhas();
  }

  void _editSenha(SenhaModel senha) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormularioScreen(senha: senha),
      ),
    ).then((_) => _carregarSenhas());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Contas"),
      ),
      body: ListView.builder(
        itemCount: _senhas.length,
        itemBuilder: (context, index) {
          final senha = _senhas[index];
          return ListTile(
            title: Text(senha.descricao),
            subtitle: Text("Usuário: ${senha.usuario}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editSenha(senha),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteSenha(senha.id),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormularioScreen(),
            ),
          ).then((_) => _carregarSenhas());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
