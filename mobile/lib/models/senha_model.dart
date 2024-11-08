class SenhaModel {
  final String id;
  final String descricao;
  final String usuario;
  final String valor;

  SenhaModel({
    required this.id,
    required this.descricao,
    required this.usuario,
    required this.valor,
  });

  factory SenhaModel.fromJson(Map<String, dynamic> json) {
    return SenhaModel(
      id: json['id'] as String,
      descricao: json['descricao'] as String,
      usuario: json['usuario'] as String,
      valor: json['valor'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descricao': descricao,
      'usuario': usuario,
      'valor': valor,
    };
  }

  SenhaModel copyWith({
    String? id,
    String? descricao,
    String? usuario,
    String? valor,
  }) {
    return SenhaModel(
      id: id ?? this.id,
      descricao: descricao ?? this.descricao,
      usuario: usuario ?? this.usuario,
      valor: valor ?? this.valor,
    );
  }
}
