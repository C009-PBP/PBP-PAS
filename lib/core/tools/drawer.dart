import 'package:flutter/material.dart';

import 'package:healthbud/authentication/page/LoginPage.dart';
import 'package:healthbud/bmi/page/bmi_calculator_page.dart';

import 'package:healthbud/main.dart';

//source:   https://stackoverflow.com/questions/66925164/refactoring-dart-code-into-a-separate-file
enum ScreenName {
  Login,
  Home,
  BMI,
  BMI_Detail,
}

class DrawerClass extends StatefulWidget {
  final ScreenName parentScreen;

  const DrawerClass({required this.parentScreen});

  @override
  _DrawerClassState createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Home'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: 'HealthBud')),
              );
            },
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),

          ListTile(
            title: const Text('Kalkulator BMI'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BMIPage()),
              );
            },
          ),

        ],
      ),
    );
  }
}
