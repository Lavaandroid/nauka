import 'package:flutter/material.dart';


class Pytanie extends StatelessWidget{

  final String tekstpytania; //final mowi ze ta wartosc nigdy sie nie zmieni po swoim zainicjowaniu
  Pytanie(this.tekstpytania); //pierwszy argument- po konstruktrze pytanie zostanie zapisany w stringu trescpytania
  @override
  Widget build(BuildContext context){
    return Container (
      width:double.infinity, //ustawiam, ze szerokosc jest najwieksza jak mozliwe
      margin: EdgeInsets.all(10), //ustawian margin na 10px. mozna tez uzyc .only i wybrac kierunek, a wiec ustawiac rozna wielkosc margin dla kazdego kierunku
      child:
    Text(
        tekstpytania,
        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,),
      textAlign: TextAlign.center,
    ),);
  }
}