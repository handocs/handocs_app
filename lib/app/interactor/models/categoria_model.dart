import 'package:flutter/material.dart';

class CategoriaModel {
  final int id;
  final String nome;
  final Icon icone;
  final int qtdeItens;
  final int qtdeCompartilhados;
  final DateTime criadoEm;
  final DateTime atualizadoEm;
  final DateTime deletadoEm;

  CategoriaModel(
      {required this.id,
      required this.nome,
      required this.icone,
      required this.qtdeItens,
      required this.qtdeCompartilhados,
      required this.criadoEm,
      required this.atualizadoEm,
      required this.deletadoEm});

  CategoriaModel copyWith(
      {int? id,
      String? nome,
      Icon? icone,
      int? qtdeItens,
      int? qtdeCompartilhados,
      DateTime? criadoEm,
      DateTime? atualizadoEm,
      DateTime? deletadoEm}) {
    return CategoriaModel(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        icone: icone ?? this.icone,
        qtdeItens: qtdeItens ?? this.qtdeItens,
        qtdeCompartilhados: qtdeCompartilhados ?? this.qtdeCompartilhados,
        criadoEm: criadoEm ?? this.criadoEm,
        atualizadoEm: atualizadoEm ?? this.atualizadoEm,
        deletadoEm: deletadoEm ?? this.deletadoEm);
  }
}
