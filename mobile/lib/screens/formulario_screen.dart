import 'package:flutter/material.dart';
import '../models/senha_model.dart';
import '../services/api_service.dart';
import 'dart:math';

class FormularioScreen extends StatefulWidget {
  final SenhaModel? senha;

  const FormularioScreen({Key? key, this.senha}) : super(key: key);

  @override
  _FormularioScreenState createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final TextEditingController siteController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final ApiService _apiService = ApiService();
  int selectedLength = 8;

  @override
  void initState() {
    super.initState();
    if (widget.senha != null) {
      siteController.text = widget.senha!.descricao;
      loginController.text = widget.senha!.usuario;
      senhaController.text = widget.senha!.valor;
    }
  }

  String gerarSenhaAleatoria(int length) {
    const String characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final Random random = Random();
    return List.generate(length, (index) => characters[random.nextInt(characters.length)]).join();
  }

  void _showGerarSenhaDialog() {
    showDialog(
      context: context,
      builder: (context) {
        int localLength = selectedLength;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Gerar Senha"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Escolha o número de caracteres:"),
                  DropdownButton<int>(
                    value: localLength,
                    items: List.generate(11, (index) => 6 + index)
                        .map((value) => DropdownMenuItem(
                              value: value,
                              child: Text(value.toString()),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        localLength = value!;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: Text("Cancelar"),
                  onPressed: () => Navigator.pop(context),
                ),
                ElevatedButton(
                  child: Text("Gerar"),
                  onPressed: () {
                    final senhaGerada = gerarSenhaAleatoria(localLength);
                    setState(() {
                      selectedLength = localLength;
                    });
                    senhaController.text = senhaGerada;
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.senha == null ? "Nova Conta" : "Editar Conta"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: siteController,
              decoration: InputDecoration(
                labelText: "Site/Aplicativo",
                hintText: "Exemplo: www.site.com",
              ),
            ),
            TextField(
              controller: loginController,
              decoration: InputDecoration(labelText: "Login"),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: senhaController,
                    decoration: InputDecoration(labelText: "Senha"),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _showGerarSenhaDialog,
                  child: Text("Gerar"),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Salvar"),
              onPressed: () async {
                final novaSenha = SenhaModel(
                  id: widget.senha?.id ?? "", 
                  descricao: siteController.text,
                  usuario: loginController.text,
                  valor: senhaController.text,
                );
                
                if (widget.senha == null) {
                  await _apiService.createSenha(novaSenha);
                } else {
                  await _apiService.updateSenha(novaSenha);
                }

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
