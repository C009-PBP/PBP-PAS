import 'package:flutter/widgets.dart';
import 'package:healthbud/bmi/page/bmi_calculator_page.dart';

import 'package:healthbud/bmi/page/bmi_detail.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:healthbud/bmi/model/bmi.dart';

import 'package:healthbud/main.dart';
import 'package:healthbud/authentication/page/LoginPage.dart';

import 'dart:convert';

import 'package:healthbud/bmi/tools/fetcherBMI.dart';

import 'package:healthbud/core/tools/drawer.dart';

import 'package:healthbud/core/tools/loggedInUser.dart';

import 'package:healthbud/core/model/user.dart';

class BMI_Center extends StatefulWidget {
  const BMI_Center({super.key});

  @override
  State<BMI_Center> createState() => _BMI_CenterState();
}

class _BMI_CenterState extends State<BMI_Center> {
  final _formKey = GlobalKey<FormState>();
  int _umur = 0;
  int _tinggi = 0;
  int _berat = 0;
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
                Text("Selamat datang, ${loggedInUser!.username}. ayo cek BMI-mu!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: ZZ",
                      labelText: "Umur",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.nature_people_sharp),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        if (value == null || value.isEmpty) {
                          _umur = 0;
                        } else if (int.tryParse(value) != null) {
                          _umur = int.parse(value);
                        } else {
                          _umur = 0;
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _umur = int.parse(value!);
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Umur tidak boleh kosong!';
                      } else if (int.tryParse(value) == null) {
                        return 'Umur harus berupa angka!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: ZZ",
                      labelText: "Berat badan (kg)",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.monitor_weight_outlined),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        if (value == null || value.isEmpty) {
                          _berat = 0;
                        } else if (int.tryParse(value) != null) {
                          _berat = int.parse(value);
                        } else {
                          _berat = 0;
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _berat = int.parse(value!);
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Berat badan tidak boleh kosong!';
                      } else if (int.tryParse(value) == null) {
                        return 'Berat badan harus berupa angka!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: ZZ",
                      labelText: "Tinggi badan (cm)",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.height),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        if (value == null || value.isEmpty) {
                          _tinggi = 0;
                        } else if (int.tryParse(value) != null) {
                          _tinggi = int.parse(value);
                        } else {
                          _tinggi = 0;
                        }
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _tinggi = int.parse(value!);
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Tinggi tidak boleh kosong!';
                      } else if (int.tryParse(value) == null) {
                        return 'Tinggi badan harus berupa angka!';
                      }
                      return null;
                    },
                  ),
                ),
                TextButton(
                  child: const Text(
                    "Cek BMI",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final user_pk = loggedInUser!.pk;
                      var url = Uri.parse(
                          'https://health-bud.up.railway.app/bmi_calculator/add/${user_pk}');

                      // var url = Uri.parse(
                      //     'http://localhost:8000/bmi_calculator/add/${user_pk}');

                      dynamic data = {
                        // 'user': generalUser,
                        'umur': _umur.toString(),
                        'tinggi': _tinggi.toString(),
                        'berat': _berat.toString(),
                      };

                      var bmi_post_response;
                      var bmi_result;
                      try {
                        print("::::::");
                        bmi_post_response = await request.post(
                            'https://health-bud.up.railway.app/bmi_calculator/add/${user_pk}',
                            data);

                        // bmi_post_response = await request.post(
                        //     'https://health-bud.up.railway.app/bmi_calculator/add/${user_pk}',
                        //     data
                        //     );

                        bmi_post_response = await request.post(
                            'http://localhost:8000/bmi_calculator/add/${user_pk}',
                            data
                            );
                        print("P");
                        var meter_tinggi = _tinggi / 100;
                        bmi_result = _berat / (meter_tinggi * meter_tinggi);
                      } catch (e) {
                        print(e);
                        print("Error post bmi");
                      }

                      // print(bmi_post_response);

                      var bmi_rslt = 0;

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
                                      child: bmi_post_response != null
                                          ? Text(
                                              'Data berhasil dimasukkan. Hasil BMI Anda: ${bmi_result}')
                                          : Text("Gagal menambah BMI.")),
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
                SizedBox(height: 25, width: 25),
                TextButton(
                    child: const Text(
                      "Lihat histori BMI Saya",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BMIPage()),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
