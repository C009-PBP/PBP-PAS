import 'package:flutter/material.dart';
import 'package:healthbud/core/tools/drawer.dart';
import 'package:healthbud/pengaturan_akun/page/pengaturan_akun_page.dart';
import 'package:healthbud/core/tools/loggedInUser.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProfileFormPage extends StatefulWidget {
  const ProfileFormPage({super.key});

  @override
  State<ProfileFormPage> createState() => _ProfileFormPageState();
}

class _ProfileFormPageState extends State<ProfileFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _firstname = '';
  String _lastname = '';
  String _phone = '';
  String _email = '';
  DateTime? _dob;
  String _address = '';
  String _city = '';
  String? _province;
  String _gender = '';
  List<String> provinces = ['Aceh','Sumatra Utara','Sumatra Barat','Riau','Kep. Riau','Jambi','Bengkulu','Sumatra Selatan','Kep. Bangka Belitung','Lampung','Banten',
    'DKI Jakarta','Jawa Barat','Jawa Tengah','DI Yogyakarta','Jawa Timur','Bali','NTB','NTT','Kalimantan Barat','Kalimantan Tengah','Kalimantan Selatan','Kalimantan Timur',
    'Kalimantan Utara','Sulawesi Barat','Sulawesi Selatan','Sulawesi Tenggara','Sulawesi Tengah','Gorontalo','Sulawesi Utara','Maluku Utara','Maluku','Papua Barat','Papua',
    'Papua Tengah','Papua Pegunungan','Papua Selatan'];

  final userPk = loggedInUser!.pk;
  void submit(request, firstname, lastname, email, phone, dob, gender, address, city, province) async {
    await request.post(
        'https://health-bud.up.railway.app/pengaturan_akun/update-flutter/$userPk',
        {
          "first_name": firstname,
          "last_name": lastname,
          "email": email,
          "phone_no": phone,
          "birth_date": dob.toString(),
          "gender": gender,
          "street": address,
          "city": city,
          "province": province,
        });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pengaturan Akun'),
      ),
      drawer: const DrawerClass(parentScreen: ScreenName.pengaturanAkun),
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
                              _firstname = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              _firstname = value!;
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
                              _lastname = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              _lastname = value!;
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
                            hintText: "No. Telepon",
                            labelText: "No. Telepon",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _phone = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              _phone = value!;
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
                            hintText: "Email",
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _email = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              _email = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Email tidak boleh kosong!';
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
                              _address = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              _address = value!;
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
                              _city = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              _city = value!;
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
                          value: _province,
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
                              _province = newValue!;
                            });
                          },
                        ),
                      ),
                      TextButton(
                        child: const Text("Tanggal Lahir"),
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          ).then((date) {
                            setState(() {
                              _dob = date!;
                            });
                          });
                        },
                      ),
                      Column(
                        children: [
                          RadioListTile(
                            title: const Text("Laki-Laki"),
                            value: "Laki-Laki",
                            groupValue: _gender,
                            onChanged: (value){
                              setState(() {
                                _gender = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: const Text("Perempuan"),
                            value: "Perempuan",
                            groupValue: _gender,
                            onChanged: (value){
                              setState(() {
                                _gender = value.toString();
                              });
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff4A60E9),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              submit(request, _firstname, _lastname, _email, _phone, _dob, _gender, _address, _city, _province);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PengaturanAkunPage()),
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