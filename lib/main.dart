// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sisterflutters/mahasiswa/mahasiswa.dart';
import 'package:sisterflutters/matakuliah/matakuliah.dart';
import 'package:sisterflutters/nilai/nilai.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Service',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Navbar(),
    );
  }
}

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    DataMahasiswa(),
    DataMatakuliah(),
    DataNilai(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Mahasiswa',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Matakuliah',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.numbers),
              label: 'Nilai',
              backgroundColor: Colors.blue),
        ],
      ),
    );
  }
}
