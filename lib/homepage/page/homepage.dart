import 'package:flutter/widgets.dart';

import 'package:healthbud/homepage/page/homepage.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:healthbud/homepage/model/homepage_review.dart';

import 'package:healthbud/main.dart';
import 'package:healthbud/authentication/page/LoginPage.dart';

import 'dart:convert';

import 'package:healthbud/homepage/tools/fetcherHomepage.dart';

import 'package:healthbud/core/tools/drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _formKey = GlobalKey<FormState>();
  String _review = "";
  DateTime? datetime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      drawer: DrawerClass(parentScreen: ScreenName.BMICalculatorPage),
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
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      

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
                                      child: const Text(
                                          'Data berhasil dimasukkan!')),
                                  SizedBox(height: 20),
                                  // TODO: Munculkan informasi yang didapat dari form
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Kembali'),
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
