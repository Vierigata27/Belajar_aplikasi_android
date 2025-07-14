import 'package:flutter/material.dart';
import 'package:latihan_dasar/halaman_kedua.dart';

class HalamanPertama extends StatelessWidget {
  const HalamanPertama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Text('Halaman Pertama'),
     ), 
     body: Center(
      child: ElevatedButton(
        onPressed: (){
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context){
                return HalamanKedua(
                  data: 'Data ini dikirim dari halaman utama : 123',
                );
              }
          ),
          // (Route<dynamic>a){
          //   return a.isFirst;
          // }
          );
        }, 
        child: Text(
        'Pergi Kehalaman Kedua'
      ),
      ),
     ),
    );
  }
}