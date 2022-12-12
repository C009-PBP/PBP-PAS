import 'package:flutter/material.dart';
import 'package:healthbud/core/tools/drawer.dart';
import 'package:healthbud/pengaturan_akun/page/riwayat_kesehatan_page.dart';
import 'package:healthbud/core/tools/loggedInUser.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class EmergencyFormPage extends StatefulWidget {
  const EmergencyFormPage({super.key});

  @override
  State<EmergencyFormPage> createState() => _EmergencyFormPageState();
}

class _EmergencyFormPageState extends State<EmergencyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _emergencyfirst = '';
  String _emergencylast = '';
  String _emergencyrelation = '';
  String _emergencyphone = '';
  String _emergencyaddress = '';
  String _emergencycity = '';
  String? _emergencyprovince;

  List<String> provinces = ['Aceh','Sumatra Utara','Sumatra Barat','Riau','Kep. Riau','Jambi','Bengkulu','Sumatra Selatan','Kep. Bangka Belitung','Lampung','Banten',
    'DKI Jakarta','Jawa Barat','Jawa Tengah','DI Yogyakarta','Jawa Timur','Bali','NTB','NTT','Kalimantan Barat','Kalimantan Tengah','Kalimantan Selatan','Kalimantan Timur',
    'Kalimantan Utara','Sulawesi Barat','Sulawesi Selatan','Sulawesi Tenggara','Sulawesi Tengah','Gorontalo','Sulawesi Utara','Maluku Utara','Maluku','Papua Barat','Papua',
    'Papua Tengah','Papua Pegunungan','Papua Selatan'];

  final userPk = loggedInUser!.pk;
  void submit(request, firstname, lastname, relationship, phone, address, city, province) async {
    await request.post(
        'https://health-bud.up.railway.app/pengaturan_akun/update-emergency-flutter/$userPk',
        {
          "emergency_firstname": firstname,
          "emergency_lastname": lastname,
          "emergency_relationship": relationship,
          "emergency_phone_no": phone,
          "emergency_street": address,
          "emergency_city": city,
          "emergency_province": province,
        });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Kontak Darurat'),
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
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Nama Depan",
                            labelText: "Nama Depan",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _emergencyfirst = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              _emergencyfirst = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama depan tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Nama Belakang",
                            labelText: "Nama Belakang",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _emergencylast = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              _emergencylast = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama belakang tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Hubungan dengan Pasien",
                            labelText: "Hubungan dengan Pasien",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _emergencyrelation = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              _emergencyrelation = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Hubungan dengan Pasien tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "No. Telepon",
                            labelText: "No. Telepon",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _emergencyphone = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              _emergencyphone = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'No. Telepon tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Alamat",
                            labelText: "Alamat",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _emergencyaddress = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              _emergencyaddress = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Alamat tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Kota",
                            labelText: "Kota",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _emergencycity = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              _emergencycity = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Kota tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          value: _emergencyprovince,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          hint: const Text('Provinsi'),
                          items: provinces.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _emergencyprovince = newValue!;
                            });
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
                              submit(request, _emergencyfirst, _emergencylast, _emergencyrelation, _emergencyphone, _emergencyaddress, _emergencycity, _emergencyprovince);
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