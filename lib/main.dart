import 'package:flutter/material.dart'; //daje wyglad material design


import './pytania.dart';
import './przyciski.dart';


void main() {

  runApp(Aplikacja()); //funkcja rowniez zawarta w material.dart, uruchamia aplikacje

}

//void main() =>runApp(MyApp()); gdy jest tylko jedna linia warunku to mozna uzyc tego skrotu

class Aplikacja extends StatefulWidget {
  //oznacza, ze bedzie korzystac z innej class, zamienia nasza aplikacje w klase ktora moze uzywac flutter
// zmienne, variables to properties
//funkcje to methods

  @override
  State<StatefulWidget> createState() { //na koncu musi zwrocic state object, ktory jest polaczony ze stateful object
    // TODO: implement createState //zrobione
    return _AplikacjaState();   //podloga przed nazwa oznacza, ze mozemy uzyc tej klasy tylko w tym pliku. Jest to zabezpieczenie przed ewentualna zmiana przy tworzeniu projektu skladajacego siez kilku plikow
  }
}

class _AplikacjaState extends State<Aplikacja>{   //state to generic class z material dart. Mamy 2 klasy bo widget moze byc odtworzony, ale state jest przylaczony do classy, ale nie moze byc odtworzony, wiec jezeli zmienia ie wewnetrzna informacja to nie wplywa na niego, wiec trzeb astworzyc inne. Objekt typu state i jest polaczony z Aplikacja, ktora jest stateful


  var _indekspytan=0;

  final pytania= const [         //[] zawiera liste, w tym przypadku pytan, const- ostetczna wartosci nigdy sie nie zmini, compiletime igdy sie nie zmieni const

    {'tekstPytan': 'Jaki jest Twoj ulubiony kolor', //nie jest lista, ale kolekcja kluczy wartosci, pierwsza czesc to klucz, druga wartosc
      'odpowiedzi': ['Czarny', 'Czerwony', 'Zielony', 'Bialy']}
    ,
    {'tekstPytan': 'Jakie jest Twoje ulubione zwierzątko',
      'odpowiedzi': ['Pies', 'Kot', 'Zebra', 'Królik']
    }
    ,
    {'tekstPytan': 'W jakim jezyku jest ta aplikacja',
      'odpowiedzi': ['Java', 'c++', 'Kotlin', 'Dart']
    }

  ];

  void _odpowiedzi(){



    setState(() {        //musimy powiedziec aplikacji zeby wyrenderowala jeszcze raz napis, bo samo sie nie zrobi, gdyz musialaby renderowac z kazdym nacisnieciem, a to by bardzo zle wplynelo na wydajnosc

      _indekspytan = _indekspytan + 1;
    });
    print(_indekspytan);
    // print('Wybrana odpowiedz');

    if (_indekspytan<pytania.length) {

      print('Mamy więcej pytań');

    }

  }
  @override //nie jest wymagane, jest dekoratorem, ktory rowniez pochodzi z material.dart. Zaznacza ze overridujemy build method
  Widget build(BuildContext context){ // build context jest zawarty w material design, context specjalny objekt ktory flutter bedzie wywolywany przez fluttera
    //chce wybudowac widget

    return MaterialApp(
      home: Scaffold(      //zawiera podstawowy setup, zeby zmienic moje widgety na apliakcje
          appBar: AppBar(     //belka na gorze, dostosowuje sie do wielkosci ekranu
            title: Text('Moja pierwsza aplikacja'),
            backgroundColor: Colors.yellow,
          ),
          body:

          Column(     //zawiera liste widgetow, bo inaczej nie mozna umiescic kilku jesli chce, zeby byly w rzedzie to uzywam row
            children: [

              Pytanie(
                pytania[_indekspytan]['tekstPytan']?.toString()??'', //pytania.elementAt(0), //wyswietli pierwsze pytanie z listy
              ),


              // ElevatedButton  ( child: Text('Odpowiedź 1'),  onPressed: _odpowiedzi, style: ElevatedButton.styleFrom(primary: Colors.red, onPrimary: Colors.black)  ),  //tworze przycisk, nastepnie onpressed zawiera funkcje ktora program uruchomi po nacisnieciu
              //ElevatedButton(child: Text('Odpowiedź 2'),  onPressed: _odpowiedzi, style: ElevatedButton.styleFrom(primary: Colors.orange, textStyle: TextStyle(fontSize: 10, fontStyle: FontStyle.italic)),),
              //Odpowiedz(_odpowiedzi),

              ...(pytania[_indekspytan]['odpowiedzi'] as List<String> ).map((odpowiedz)   { //kropki zapobiegaja tworzeniu 2 listy, podmienia wartosci

                return Odpowiedz(_odpowiedzi,  odpowiedz);

              }).toList()


            ],

          ) ,

          backgroundColor: Colors.blue
      ),);
    //scaffold pochodzi z material dart, jego zadaniem jest tworzenie podstawowej struktury kolorow, theme itp. strony
  }
}