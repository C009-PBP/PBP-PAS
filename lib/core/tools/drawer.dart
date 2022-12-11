import 'package:flutter/material.dart';

import 'package:healthbud/authentication/page/LoginPage.dart';
import 'package:healthbud/bmi/page/bmi_calculator_page.dart';
import 'package:healthbud/bmi/page/bmi_calculator_center.dart';
import 'package:healthbud/homepage/page/homepage.dart';

import 'package:healthbud/main.dart';

import 'package:healthbud/core/tools/loggedInUser.dart';

//source:   https://stackoverflow.com/questions/66925164/refactoring-dart-code-into-a-separate-file
enum ScreenName {
  Login,
  Home,
  BMI,
  BMI_Detail,
  BMICalculatorPage,
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
          loggedInUser != null
              ? ListTile(
                  title: const Text('Logout'),
                  onTap: () async {
                    // Route menu ke halaman form
                    var url = Uri.parse(
                        'https://health-bud.up.railway.app/auth/logout/');

                    var response;
                    try {
                      response = await request.logout(
                          "https://health-bud.up.railway.app/auth/logout/");
                      // print((utf8.decode(response.bodyBytes)));
                      print(response);
                      loggedInUser = null;
                    } catch (err) {
                      print("axz");
                    }
                    print(response);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MyHomePage(title: 'HealthBud')),
                    );
                  },
                )
              : ListTile(
                  title: const Text('Login'),
                  onTap: () {
                    // Route menu ke halaman form
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                ),

          ListTile(
            title: const Text('Homepage'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Homepage()),
              );
            },
          ),

          ListTile(
            title: const Text('Kalkulator BMI'),
            onTap: () {
              if (loggedInUser != null) {
                if (loggedInUser!.role == 'pasien') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const BMIPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        "Maaf, Anda harus terdaftar sebagai pasien untuk mengakses aplikasi ini."),
                  ));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      "Maaf, Anda harus terdaftar sebagai pasien untuk mengakses aplikasi ini."),
                ));
              }
            },
          ),

          ListTile(
            title: const Text('Kalkulator BMI Test'),
            onTap: () {
              // Route menu ke halaman form
              if (loggedInUser != null) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BMI_Center()),
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BMIPage()),
                );
              }

              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => BMI_Center()),
              // );
            },
          ),
        ],
      ),
    );
  }
}
