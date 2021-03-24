import 'package:flutter/material.dart';


import './przyciski.dart';
import './pytania.dart';


class Quiz extends StatelessWidget {

  final List<Map<String, Object>> pytania;
  final  odpowiedzi;
  final int indekspytan;

  Quiz({required this.pytania, required this.odpowiedzi, required this.indekspytan});

  @override
  Widget build(BuildContext context) {
    return       Column(     //zawiera liste widgetow, bo inaczej nie mozna umiescic kilku jesli chce, zeby byly w rzedzie to uzywam row
      children: [

        Pytanie(
          pytania[indekspytan]['tekstPytan']?.toString()??'', //pytania.elementAt(0), //wyswietli pierwsze pytanie z listy
        ),


        // ElevatedButton  ( child: Text('Odpowiedź 1'),  onPressed: _odpowiedzi, style: ElevatedButton.styleFrom(primary: Colors.red, onPrimary: Colors.black)  ),  //tworze przycisk, nastepnie onpressed zawiera funkcje ktora program uruchomi po nacisnieciu
        //ElevatedButton(child: Text('Odpowiedź 2'),  onPressed: _odpowiedzi, style: ElevatedButton.styleFrom(primary: Colors.orange, textStyle: TextStyle(fontSize: 10, fontStyle: FontStyle.italic)),),
        //Odpowiedz(_odpowiedzi),

        ...(pytania[indekspytan]['odpowiedzi'] as List<Map<String, Object>> ).map((odpowiedz)   { //kropki zapobiegaja tworzeniu 2 listy, podmienia wartosci

          return Odpowiedz (() => odpowiedzi(odpowiedz['punkty']),  odpowiedz['treść']?.toString()??'');

        }).toList()

      ],
    );

  }
}
