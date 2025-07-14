import 'package:flutter/material.dart';
import 'package:latihan_dasar/halaman_kedua.dart';
import 'package:latihan_dasar/halaman_ketiga.dart';
import 'package:latihan_dasar/home.dart';

class HalamanMenu extends StatefulWidget {
  const HalamanMenu({super.key});

  @override
  State<HalamanMenu> createState() => _HalamanMenuState();
}

class _HalamanMenuState extends State<HalamanMenu> {
  
  int selectedMenu = 0;

  List menu = [
    Homepage(),
    HalamanKedua(data: 'data halaman 2'),
    HalamanKetiga(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
      title: const Text('KeuanganKu'),
      // leading: const Icon(Icons.home),
      backgroundColor: Colors.brown,
      foregroundColor: Colors.white,
    ),

     drawer: Container(
      color: Colors.white,
      child: Column(
        children: [
          DrawerHeader(child: Text('Latihan Drawer')),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: (){
              setState(()
              {
                Navigator.pop(context);
                selectedMenu = 0;
              });
            },
          ),
        ],
      ),
    ),

  body: menu.elementAtOrNull(selectedMenu),
  bottomNavigationBar: BottomNavigationBar(
    selectedItemColor: const Color.fromARGB(255, 172, 102, 12),
    currentIndex: selectedMenu,
    onTap: (v){
      setState(() {
        selectedMenu = v;
      });
    },
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Beranda',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Cari',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Pengaturan',
      ),
     ],
    ),

    );
  }
}