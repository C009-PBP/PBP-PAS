import 'package:flutter/material.dart';
import 'package:healthbud/core/tools/drawer.dart';
import 'package:healthbud/pengaturan_akun/page/riwayat_kesehatan_page.dart';
import 'package:healthbud/core/tools/loggedInUser.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RiwayatFormPage extends StatefulWidget {
  const RiwayatFormPage({super.key});

  @override
  State<RiwayatFormPage> createState() => _RiwayatFormPageState();
}

class _RiwayatFormPageState extends State<RiwayatFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? _bloodtype;
  String _bloodpressure = '';
  String _illnesses = '';
  String _allergies = '';

  List<String> goldar = ['A','B','AB','O'];

  final userPk = loggedInUser!.pk;
  void submit(request, bloodtype, bloodpressure, illnesses, allergies) async {
    await request.post(
        'https://health-bud.up.railway.app/pengaturan_akun/update-record-flutter/$userPk',
        {
          "bloodtype": bloodtype,
          "bloodpressure": bloodpressure,
          "illnesses": illnesses,
          "allergies": allergies,
        });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Riwayat Kesehatan'),
      ),
      drawer: const DrawerClass(parentScreen: ScreenName.riwayatKesehatan),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          value: _bloodtype,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          hint: const Text('Golongan Darah'),
                          items: goldar.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _bloodtype = newValue!;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Tekanan Darah",
                            labelText: "Tekanan Darah",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _bloodpressure = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              _bloodpressure = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Tekanan darah tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Riwayat Penyakit",
                            labelText: "Riwayat Penyakit",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _illnesses = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              _illnesses = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Riwayat penyakit tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Riwayat Alergi",
                            labelText: "Riwayat Alergi",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _allergies = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              _allergies = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Riwayat alergi tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff4A60E9),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              submit(request, _bloodtype, _bloodpressure, _illnesses, _allergies);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RiwayatKesehatanPage()),
                              );
                            }
                          },
                          child: const Text(
                            "Simpan",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ]
                )
            )
        ),
      ),
    );
  }
}