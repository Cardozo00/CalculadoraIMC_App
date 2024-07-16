import 'package:flutter/material.dart';

class Pessoa {
  final String _id = UniqueKey().toString();
  double _peso = 0;
  double _altura = 0;
  double _idade = 0;

  Pessoa(this._peso, this._altura, this._idade);
  String get id => _id;

  void setPeso(double peso) {
    _peso = peso;
  }

  double getPeso() {
    return _peso;
  }

  void setAltura(double altura) {
    _altura = altura;
  }

  double getAltura() {
    return _altura;
  }

  void setIdade(double idade) {
    _idade = idade;
  }

  double getIdade() {
    return _idade;
  }

  void aumentarIdade() {
    _idade++;
  }

  void diminuirIdade() {
    _idade--;
  }

  double resultado = 0;
  String frase = "";

  double calcularIMC(double altura, double peso) {
    resultado = peso / (altura * altura);
    if (resultado < 16) {
      frase = ("você está com margreza grave");
    }
    if (resultado >= 16 && resultado < 17) {
      frase = ("você está co margreza moderada");
    }
    if (resultado >= 17 && resultado < 18.5) {
      frase = ("você está co, margreza leve");
    }
    if (resultado >= 18.5 && resultado < 25) {
      frase = ("você está saudável");
    }
    if (resultado >= 25 && resultado < 30) {
      frase = ("você está com obesidade grau 1");
    }
    if (resultado >= 30 && resultado < 40) {
      frase = ("você está com obesidade grau 2");
    }
    if (resultado >= 40) {
      frase = ("você está com obesidade grau 3");
    }

    return resultado;
  }
}
