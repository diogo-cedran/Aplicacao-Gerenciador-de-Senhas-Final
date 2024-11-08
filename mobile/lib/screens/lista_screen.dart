import 'package:flutter/material.dart';
import '../models/senha_model.dart';
import '../services/api_service.dart';
import 'formulario_screen.dart';

class ListaScreen extends StatefulWidget {
  @override
  _ListaScreenState createState() => _ListaScreenState();
}

class _ListaScreenState extends State<ListaScreen> {
  late Future<List<SenhaModel>> _senhasFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _senhasFuture = _apiService.getSenhas();
  }

  void _refreshSenhas() {
    setState(() {
      _senhasFuture = _apiService.getSenhas();
    });
  }

  void _deleteSenha(String id) async {
    await _apiService.deleteSenha(id);
    _refreshSenhas();
  }

  void _editSenha(SenhaModel senha) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormularioScreen(senha: senha),
      ),
    );
    _refreshSenhas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Senhas"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder<List<SenhaModel>>(
        future: _senhasFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Não foi possível carregar as senhas."));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Nenhuma senha encontrada."));
          }

          final senhas = snapshot.data!;
          return ListView.builder(
            itemCount: senhas.length,
            itemBuilder: (context, index) {
              final senha = senhas[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(senha.descricao),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Usuário: ${senha.usuario}"),
                      Text("Senha: ${senha.valor}"),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _editSenha(senha),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteSenha(senha.id!), // Afirmando que o ID não é nulo
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormularioScreen()),
          );
          _refreshSenhas();
        },
      ),
    );
  }
}
