import 'package:flutter/widgets.dart';
import 'package:healthbud/core/tools/loggedInUser.dart';

import 'package:healthbud/homepage/page/homepage_page.dart';
import 'package:healthbud/bmi/page/bmi_calculator_page.dart';
import 'package:healthbud/bmi/page/bmi_calculator_center.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:healthbud/homepage/model/homepage_review.dart';

import 'package:healthbud/main.dart';
import 'package:healthbud/authentication/page/LoginPage.dart';

import 'dart:convert';

import 'package:healthbud/homepage/tools/fetcherHomepage.dart';

import 'package:healthbud/core/tools/drawer.dart';

class Homepage_Form extends StatefulWidget {
  const Homepage_Form({super.key});

  @override
  State<Homepage_Form> createState() => _Homepage_FormState();
}

class _Homepage_FormState extends State<Homepage_Form> {
  final _formKey = GlobalKey<FormState>();
  String _review = "";
  DateTime? datetime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      drawer: DrawerClass(parentScreen: ScreenName.Homepage),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Review",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.people),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        if (value == null || value.isEmpty) {
                          _review = '';
                        } else if (value != null) {
                          _review = value;
                        } else {
                          _review = '';
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _review = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Review tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                TextButton(
                  child: const Text(
                    "Tambahkan",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xff4A60E9)),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final user_pk = loggedInUser!.pk;
                      var url = Uri.parse(
                          'https://health-bud.up.railway.app/add/${user_pk}');

                      // var url =
                      //     Uri.parse('http://localhost:8000/add/${user_pk}');

                      dynamic data = {
                        // 'user': generalUser,
                        'review': _review,
                      };

                      var review_post_response;
                      try {
                        print("::::::");
                        review_post_response = await request.post(
                            'https://health-bud.up.railway.app/add-flutter/', data);
                        // review_post_response = await request.post(
                        //     'http://localhost:8000/add-flutter/', data);

                        print("P");
                      } catch (e) {
                        print(e);
                        print("Error post bmi");
                      }

                      print(review_post_response);

                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: Container(
                              child: ListView(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                shrinkWrap: true,
                                children: <Widget>[
                                  Center(
                                      child: review_post_response != null
                                          ? Text('Data berhasil dimasukkan!')
                                          : Text("Gagal menambah BMI.")),
                                  SizedBox(height: 20),
                                  // TODO: Munculkan informasi yang didapat dari form
                                  TextButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Color(0xff4A60E9)),
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage()),
                                      );
                                    },
                                    child: const Text(
                                      "Kembali",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
