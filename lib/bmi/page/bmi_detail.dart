//TODO: TAMPILIN DETAIL OBJECT BMI
//STATUS: (MUNGKIN) UDAH

import 'package:flutter/material.dart';
import 'package:healthbud/authentication/page/LoginPage.dart';

import 'package:healthbud/bmi/page/bmi_calculator_page.dart';

import 'package:healthbud/bmi/model/bmi.dart';
import 'package:healthbud/core/tools/loggedInUser.dart';

import 'package:healthbud/main.dart';

import 'package:healthbud/core/tools/drawer.dart';

class BMIDetail extends StatelessWidget {
  // In the constructor, require a Todo.
  const BMIDetail({super.key, required this.bmi_obj});

  // Declare a field that holds the Todo.
  final BMI bmi_obj;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: ListView(children: [Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              "User : ${loggedInUser!.username}",
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            )),
            const SizedBox(height: 30),
            Text(
              "Umur: ${bmi_obj.umur}",
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Tinggi: ${bmi_obj.tinggi}",
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Berat: ${bmi_obj.berat}",
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
             const SizedBox(height: 30),
            Text(
              "Disubmit tanggal : " + bmi_obj.date_created,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
             const SizedBox(height: 30),
            Text(
              "Status: " + bmi_obj.bmi_result.toString(),
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
             const SizedBox(height: 30),
            Text(
              "Deskripsi: " + bmi_obj.deskripsi_hasil,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
             const SizedBox(height: 30),
            Text(
              "keterangan_tambahan: " + bmi_obj.keterangan_tambahan,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            ListTile(
                title: const Text('Hapus histori ini'),
                onTap: () async {
                  final bmi_pk = bmi_obj.pk;

                  var response;
                  try {
                    response = await request.post(
                        'https://health-bud.up.railway.app/bmi_calculator/delete-from-flutter/${bmi_pk}',
                        {});

                    // response = await request.post(
                    //     'http://localhost:8000/bmi_calculator/delete-from-flutter/${bmi_pk}',
                    //     {

                  } catch (err) {
                    print(err);
                  }

                  if (response['status']) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const BMIPage()),
                    );
                    print(response);
                  }
                }),
            ListTile(
                title: const Text('Kembali'),
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    ]));
  }
}
