import 'dart:ffi';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    print('lebar layar saat ini adalah : $width');
    print('Tinggi layar saat ini adalah : $height');
    return Scaffold(
      // --- Appbar ---
    //   appBar:AppBar(
    //   title: const Text('KeuanganKu'),
    //   // leading: const Icon(Icons.home),
    //   backgroundColor: Colors.brown,
    //   foregroundColor: Colors.white,
    // ),

    // drawer: Container(
    //   color: Colors.white,
    //   child: Column(
    //     children: [
    //       DrawerHeader(child: Text('Latihan Drawer')),
    //       ListTile(
    //         title: Text('Home'),
    //         leading: Icon(Icons.home),
    //         onTap: (){
    //           setState(()
    //           {
    //             Navigator.pop(context);
    //             selectedMenu = 0;
    //           })
    //         },
    //       ),
    //     ],
    //   ),
    // ),
   
    
    // --- body ---
    body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),


        child: width > 800 ? 
        Row(children: [
          Expanded(child: gambar()),
          const SizedBox(width: 20),
          Expanded(child: Column(
            children: [
              data_gambar1(),
              const SizedBox(height: 20),
              judul(),
              const SizedBox(height: 20),
              deskripsi(),
            ],
          ),)
        ],)
        : Column(
          children: [
          gambar(),
          const SizedBox(height: 20), 
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: data_gambar(),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: judul(),
          ),
          const SizedBox(height: 20),
          deskripsi(),
          
          ],
        ),
      ),
    ),
    
    
   // --- FOOTER DENGAN BOTTOM NAVIGATION BAR ---
      // bottomNavigationBar: navigasi_bar(),
    );
  }
}

class navigasi_bar extends StatelessWidget {
  const navigasi_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
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
      currentIndex: 0, // Indeks item yang sedang aktif
      selectedItemColor: const Color.fromARGB(255, 172, 102, 12),
      onTap: (index) {
        // Tambahkan logika di sini saat item diklik
        print('Item yang diklik: $index');
      },
    );
  }
}

class deskripsi extends StatelessWidget {
  const deskripsi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Belajar Flutter Bersama sama disini dengan gambar kucing',
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class judul extends StatelessWidget {
  const judul({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Latihan Flutter',
      style: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.left,
    );
  }
}

class data_gambar extends StatelessWidget {
  const data_gambar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          EvaIcons.heartOutline,
          color: Colors.red,
        ),
        const SizedBox(width: 3),
        Text('134'),
        const SizedBox(width: 10),
        Icon(EvaIcons.messageSquareOutline
        ),
        const SizedBox(width: 3),
        Text('57'),
        const SizedBox(width: 10),
        Icon(EvaIcons.shareOutline
        ),
        const SizedBox(width: 3),
        Text('23'),
        const SizedBox(width: 10),
        Spacer(),
        Icon(EvaIcons.bookmarkOutline),
        Text('5'),
      ],
    );
  }
}

class data_gambar1 extends StatelessWidget {
  const data_gambar1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          EvaIcons.heartOutline,
          color: Colors.red,
        ),
        const SizedBox(width: 3),
        Text('134'),
        const SizedBox(width: 10),
        Icon(EvaIcons.messageSquareOutline
        ),
        const SizedBox(width: 3),
        Text('57'),
        const SizedBox(width: 10),
        Icon(EvaIcons.shareOutline
        ),
        const SizedBox(width: 3),
        Text('23'),
        const SizedBox(width: 10),
        Icon(EvaIcons.bookmarkOutline),
        Text('5'),
      ],
    );
  }
}

class gambar extends StatelessWidget {
  const gambar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(10),
      child: Image.asset('assets/kucing.jpg', fit: BoxFit.cover,)
      );
  }
}

