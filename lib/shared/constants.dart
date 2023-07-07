import 'package:flutter/material.dart';

abstract class AppConstants {
  static const pageNotFound = 'Pagina não encontrada';
  static const borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Colors.grey),
  );

  static const listagemFilmes = 'Filmes';
  static const listagemTV = 'Serie e Novelas';
  static const sobre = 'Sobre';
}
