//TODO: BIKIN PAGE UTAMA UNTUK BMI
//STATUS:
//FUNGSIONALITAS: ?
//DESIGN: BELUM

import 'package:healthbud/bmi/page/bmi_detail.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:healthbud/bmi/model/bmi.dart';

import 'package:healthbud/main.dart';
import 'package:healthbud/authentication/page/LoginPage.dart';

import 'dart:convert';

import 'package:healthbud/bmi/tools/fetcherBMI.dart';

import 'package:healthbud/core/tools/drawer.dart';




class BMIPage extends StatefulWidget {
  const BMIPage({Key? key}) : super(key: key);

  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kalkulator BMI'),
        ),
        drawer: DrawerClass(parentScreen: ScreenName.BMI),
        body: FutureBuilder(
            future: fetcherBMI().fetchBMI(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Belum ada histori BMI!",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => ListTile(
                            title: Text("${snapshot.data![index]}"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BMIDetail(bmi_obj: snapshot.data![index]),
                                ),
                              );
                            },
                          
                          ));
                }
              }
            }));
  }
}
