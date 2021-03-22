import 'package:flutter/material.dart';
import 'dart:core';

class Odpowiedz extends StatelessWidget {

  final  Function() opcja; //wartosc zachowana w tej wlasciwowsci musi byc funkcjsa, final nigdy sie nie zmieni
final String answerText;
  Odpowiedz(this.opcja, String this.answerText); //powtarzajac te nazwe klasy tworze konstruktora, this mowi ze cokolwiek tutaj dostane to przechowuje w opcja, czyli -odpowiedzi bedzie przechowywane w opcji
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child:
      ElevatedButton(
        child: Text(answerText),  onPressed: opcja, style: ElevatedButton.styleFrom(primary: Colors.lightGreenAccent), ),
    );
  }
}
