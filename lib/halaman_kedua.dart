import 'package:flutter/material.dart';
import 'package:latihan_dasar/halaman_ketiga.dart';

class HalamanKedua extends StatelessWidget {
  final String data;
  
  const HalamanKedua({super.key, required this.data});  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Text('Halaman kedua'),
     ), 
     body: Column(
       children: [
        Text('data dari halaman pertama '),
        Text(data),
         ElevatedButton(
           onPressed: (){
             Navigator.pushAndRemoveUntil(
               context, MaterialPageRoute(
                 builder: (context){
                   return HalamanKetiga();
                 }
             ),
             (Route<dynamic>a){
               return a.isFirst;
             }
             );
           }, 
           child: Text(
           'Kembali Kehalaman ketiga'
         ),
         ),
       ],
     ),
    );
  }
}