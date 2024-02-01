import 'package:flutter/material.dart';

Text _dataColumText(String label) => Text(label);

List<DataColumn> createCarColumns(){
  return [
    DataColumn(label: _dataColumText("Placa")),
    DataColumn(label: _dataColumText("Modelo")),
    DataColumn(label: _dataColumText("Cor")),
    DataColumn(label: _dataColumText("Entrada")),
    DataColumn(label: _dataColumText("Ações")),
  ];
}

