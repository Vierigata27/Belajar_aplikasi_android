import 'package:flutter/material.dart';
import 'package:latihan_dasar/halaman_menu.dart';
import 'package:latihan_dasar/halaman_pertama.dart';
import 'package:latihan_dasar/home.dart';
import 'package:latihan_dasar/Keuanganku/keuanganku.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true, // Direkomendasikan untuk menggunakan Material 3
      ),
      routes: {
        '/':(context){
          return HalamanMenu();
        },

        

      },

      // home: Homepage(),
      // home: Keuanganku(),
      // home: HalamanPertama(),
    );
  }
}