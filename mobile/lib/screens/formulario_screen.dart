import 'package:flutter/material.dart';
import '../models/senha_model.dart';
import '../services/api_service.dart';

class FormularioScreen extends StatefulWidget {
  final SenhaModel? senha;

  const FormularioScreen({Key? key, this.senha}) : super(key: key);

  @override
  _FormularioScreenState createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descricaoController = TextEditingController();
  final _usuarioController = TextEditingController();
  final _valorController = TextEditingController();
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    if (widget.senha != null) {
      _descricaoController.text = widget.senha!.descricao;
      _usuarioController.text = widget.senha!.usuario;
      _valorController.text = widget.senha!.valor;
    }
  }

  Future<void> _salvarSenha() async {
    if (_formKey.currentState!.validate()) {
      final senha = SenhaModel(
        id: widget.senha?.id ?? '',
        descricao: _descricaoController.text,
        usuario: _usuarioController.text,
        valor: _valorController.text,
      );

      if (widget.senha == null) {
        await apiService.addSenha(senha);
      } else {
        await apiService.updateSenha(senha);
      }

      Navigator.pop(context, true); 
    }
  }

  @override
  void dispose() {
    _descricaoController.dispose();
    _usuarioController.dispose();
    _valorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.senha == null ? 'Adicionar Senha' : 'Editar Senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe uma descrição';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _usuarioController,
                decoration: const InputDecoration(labelText: 'Usuário'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe um usuário';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _valorController,
                decoration: const InputDecoration(labelText: 'Senha'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe uma senha';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _salvarSenha,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
