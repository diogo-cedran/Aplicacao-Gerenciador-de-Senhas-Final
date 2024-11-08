import 'package:flutter/material.dart';
import '../models/senha_model.dart';

class SenhaCard extends StatelessWidget {
  final SenhaModel senha;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const SenhaCard({
    Key? key,
    required this.senha,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
              icon: Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
