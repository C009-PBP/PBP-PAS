//TODO: BIKIN PAGE UTAMA UNTUK BMI
//STATUS:
//FUNGSIONALITAS: ?
//DESIGN: BELUM

import 'package:healthbud/bmi/page/bmi_detail.dart';
import 'package:healthbud/homepage/tools/fetcherHomepage.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:healthbud/bmi/model/bmi.dart';

import 'package:healthbud/main.dart';
import 'package:healthbud/authentication/page/LoginPage.dart';

import 'dart:convert';

import 'package:healthbud/core/tools/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HealthBud Review'),
        ),
        drawer: DrawerClass(parentScreen: ScreenName.Homepage),
        body: FutureBuilder(
            future: fetcherHomepage().fetchHomepage(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Belum ada review",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        return Card(
                          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "${snapshot.data[index].fields.username}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "${snapshot.data[index].fields.review}",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      final bmi_pk =
                                          snapshot.data[index].pk;

                                      var response;
                                      try {
                                        response = await request.post(
                                            'https://health-bud.up.railway.app/delete-from-flutter/${bmi_pk}',
                                            {});

                                        // response = await request.post(
                                        //     'http://localhost:8000/delete-from-flutter/${bmi_pk}',
                                        //     {});
                                      } catch (err) {
                                        print(err);
                                      }

                                      if (response['status']) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                              const MyHomePage(title: "Homepage",)),
                                        );
                                        print(response);
                                      } 
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                        const Color(0xff4A60E9),
                                    ),
                                    child: const Text('Hapus')),
                                ),
                            ])),
                        );
                        
                      });
                }
              }
            }));
  }
}