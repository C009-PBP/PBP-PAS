import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:healthbud/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:healthbud/core/tools/drawer.dart';
import 'package:healthbud/authentication/model/user.dart';

import 'package:healthbud/core/model/user.dart';
import 'package:healthbud/core/tools/loggedInUser.dart';

import 'package:healthbud/authentication/page/LoginPage.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _loginFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String password1 = "";
  String password2 = "";
  List<String> list_role = ['Pasien', 'Dokter'];
  String role = 'Pasien';

  @override
  Widget build(BuildContext context) {
    request = context.watch<CookieRequest>();
    // The rest of your widgets are down below

    // TODO : Create login page
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Registrasi Pasien'),
      ),
      drawer: DrawerClass(parentScreen: ScreenName.Login),
      body: Form(
        key: _loginFormKey,
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
                      hintText: "Contoh: Brr",
                      labelText: "Username",
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
                        username = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        username = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Username tidak boleh kosong!';
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
                      hintText: "Isi password Anda.",
                      labelText: "Password",
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
                        password1 = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        password1 = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong!';
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
                      hintText: "Isi ulang password Anda.",
                      labelText: "Password confirmation",
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
                        password2 = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        password2 = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                ListTile(
                  leading: const Icon(Icons.class_),
                  title: const Text(
                    'Pilih Role',
                  ),
                  trailing: DropdownButton(
                    value: role,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: list_role.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        role = newValue!;
                      });
                    },
                  ),
                ),

                //TODO: IMPLEMENT REGISTER
                TextButton(
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () async {
                    // 'username' and 'password' should be the values of the user login form.
                    var response = {};
                    try {

                      if (role == 'Pasien') {
                        // response = await request.post(
                        //     "https://health-bud.up.railway.app/auth/register_pasien/", {
                        //   'username': username,
                        //   'password1': password1,
                        //   'password2': password2,
                        // });

                        response = await request.post(
                            "http://localhost:8000/auth/register_pasien/", {
                          'username': username,
                          'password1': password1,
                          'password2': password2,
                        });
                      }else{
                        // response = await request.post(
                        //     "https://health-bud.up.railway.app/auth/register_dokter/", {
                        //   'username': username,
                        //   'password1': password1,
                        //   'password2': password2,
                        // });

                        response = await request.post(
                            "http://localhost:8000/auth/register_dokter/", {
                          'username': username,
                          'password1': password1,
                          'password2': password2,
                        });
                      }

                    } catch (err) {

                      response['status'] = false;
                    }

                    print(response);

                    if (response['status']) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Register berhasil!")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Text("Register gagal. Periksa kembali passwordmu!"),
                      ));
                    }

                    if (_loginFormKey.currentState!.validate()) {
                      // List listBudget = [];
                      // listBudget.add(_namaLengkap);
                      // listBudget.add(_nominal);
                      // listBudget.add(jenisNominal);
                      // listJawaban.add(listBudget);

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
                                      child:
                                          const Text('Data berhasil masuk!')),
                                  SizedBox(height: 20),
                                  // TODO: Munculkan informasi yang didapat dari form
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Kembali'),
                                  ),

                                  SizedBox()
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),

                SizedBox(width: 15, height: 20),

                //TODO: IMPLEMENT REGISTER
                TextButton(
                    child: const Text(
                      "Kembali",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
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
