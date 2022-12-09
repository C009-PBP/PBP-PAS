import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:healthbud/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:healthbud/core/tools/drawer.dart';
import 'package:healthbud/authentication/model/user.dart';

import 'package:healthbud/core/tools/loggedInUser.dart';


var request;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String password1 = "";

  @override
  Widget build(BuildContext context) {
    request = context.watch<CookieRequest>();
    // The rest of your widgets are down below

    // TODO : Create login page
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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

                //TODO: IMPLEMENT LOGIN
                TextButton(
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () async {
                    // 'username' and 'password' should be the values of the user login form.
                    var response = {};
                    try {
                      response = await request.login(
                          "https://health-bud.up.railway.app/auth/login/", {
                        'username': username,
                        'password': password1,
                      });

                      // print(response);
                      // print("OI");
                    } catch (err) {
                      //dapet error message, bukan data-object
                      // print("HMM");
                      response['status'] = false;
                    }

                    print(response);

                    if (!mounted) return;

                    if (request.loggedIn) {
                      // Code here will run if the login succeeded.
                      // print("BERHASIL LOGIN");
                      // print(request);
                      var response_get_user;
                      try {
                        response_get_user = await request.get(
                            "https://health-bud.up.railway.app/auth/user-data");
                        // print("============");
                        print(response_get_user);
                      } catch (e) {
                        print("ERROr");
                      }

                      // var data;
                      // try {
                      //   data = jsonDecode(utf8.decode(response1.bodyBytes));
                      // } catch (e) {
                      //   print("askodaod");
                      // }

                      loggedInUser = User.fromJson(response_get_user);

                      print(loggedInUser!.username);

                      if (response['status']) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Login berhasil, selamat datang " +
                              loggedInUser!.role +
                              " " +
                              loggedInUser!.username +
                              "!"),
                        ));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              "Login gagal. Periksa username dan passwordmu!"),
                        ));
                      }
                    } else {
                      // print("GA BERHASIL LOGIN");

                      // Code here will run if the login failed (wrong username/password).
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
