import 'package:flutter/material.dart';

import 'package:healthbud/authentication/page/LoginPage.dart';
import 'package:healthbud/bmi/page/bmi_calculator_page.dart';
import 'package:healthbud/bmi/page/bmi_calculator_center.dart';
import 'package:healthbud/homepage/page/homepage_form.dart';
import 'package:healthbud/forum/views/forum_page.dart';


import 'package:healthbud/main.dart';

import 'package:healthbud/core/tools/loggedInUser.dart';
import 'package:healthbud/pengaturan_akun/page/pengaturan_akun_page.dart';

import '../../info_dokter/page/info_dokter_page.dart';

//source:   https://stackoverflow.com/questions/66925164/refactoring-dart-code-into-a-separate-file
enum ScreenName {
  Login,
  Home,
  Homepage,
  BMI,
  BMI_Detail,
  BMICalculatorPage,
  pengaturanAkun,
  riwayatKesehatan,
  Info_Dokter,
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
                    var response;
                    try {
                      response = await request.logout(
                          "https://health-bud.up.railway.app/auth/logout/");

                      // response = await request.logout(
                      //     "http://localhost:8000/auth/logout/");

                      // print((utf8.decode(response.bodyBytes)));
                      print(response);
                      loggedInUser = null;
                      generalUser = null;
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
            title: const Text('Kalkulator BMI'),
            onTap: () {
              if (loggedInUser != null) {
                if (loggedInUser!.role == 'pasien') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const BMI_Center()),
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
            title: const Text('Pengaturan Akun'),
            onTap: () {
              if (loggedInUser != null) {
                if (loggedInUser!.role == 'pasien' ||
                    loggedInUser!.role == 'dokter') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PengaturanAkunPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        "Maaf, Anda harus terdaftar sebagai pasien atau dokter untuk mengakses aplikasi ini."),
                  ));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      "Maaf, Anda harus terdaftar sebagai pasien atau dokter untuk mengakses aplikasi ini."),
                ));
              }
            },
          ),
          ListTile(
            title: const Text('Info Dokter'),
            onTap: () {
              // Route menu ke halaman info dokter
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => InfoDokterPage()),
              );
            },
          ),

          ListTile(
            title: const Text('Forum'),
              onTap: () {
                // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ForumPage()),
                  );
              },
          ),
        ],
      ),
    );
  }
}
