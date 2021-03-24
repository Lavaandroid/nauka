import 'package:flutter/material.dart';




class Wynik extends StatelessWidget {

  final int liczbapunktow;
  final  reset;

  Wynik(this.liczbapunktow, this.reset);


  String get wynik{

    var tekstwyniku='Gratulacje';
    if(liczbapunktow<=8) {
      tekstwyniku = 'Jesteś super!';
    }
    else if (liczbapunktow<=12)
      {

        tekstwyniku='Nieżle';
      } else if(liczbapunktow<=16){
      tekstwyniku='Hmmm?';
    }
    else
      tekstwyniku='Dzieki';
    return tekstwyniku;
  }


  @override
  Widget build(BuildContext context) {
    return Center(

      child:  Column(
        children: [
          Text(

            wynik,
              style: TextStyle(
                  color: Colors.white,
              fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center

          ),
        
        TextButton(child: Text('Restart!'),
          style: TextButton.styleFrom(primary: Colors.red, textStyle: TextStyle(fontSize: 20)  ),
          onPressed: reset,)
        ],
      )

    );
  }
}
