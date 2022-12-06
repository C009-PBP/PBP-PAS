//TODO: TAMPILIN DETAIL OBJECT BMI
//STATUS: (MUNGKIN) UDAH

import 'package:flutter/material.dart';

import 'package:healthbud/page/bmi_calculator_page.dart';

import 'package:healthbud/model/bmi.dart';

import 'package:healthbud/main.dart';

import 'package:healthbud/tools/drawer.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
              "User : ${bmi_obj.user}",
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            )
            ),
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

            const SizedBox(height: 10),
            Text(
              "Disubmit tanggal : " + bmi_obj.date_created,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),
            Text(
              "Status: " + bmi_obj.bmi_result.toString(),
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),


            const SizedBox(height: 10),
            Text(
              "Deskripsi: \n" + bmi_obj.deskripsi_hasil,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            
            const SizedBox(height: 10),
            Text(
              "keterangan_tambahan: \n" + bmi_obj.keterangan_tambahan,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 15),

            ListTile(
                title: const Text('Kembali'),
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
