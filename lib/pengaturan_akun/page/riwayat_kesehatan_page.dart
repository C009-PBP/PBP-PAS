import 'package:flutter/material.dart';
import 'package:healthbud/core/tools/drawer.dart';
import 'package:healthbud/pengaturan_akun/page/pengaturan_akun_page.dart';
import 'package:healthbud/pengaturan_akun/tools/fetch_akun.dart';

class RiwayatKesehatanPage extends StatefulWidget {
  const RiwayatKesehatanPage({super.key});

  @override
  State<RiwayatKesehatanPage> createState() => _RiwayatKesehatanPageState();
}

class _RiwayatKesehatanPageState extends State<RiwayatKesehatanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Riwayat Kesehatan'),
        ),
        drawer: DrawerClass(parentScreen: ScreenName.riwayatKesehatan),
        body: FutureBuilder(
            future: fetchProfile(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0 , 20, 20, 10),
                          height: 40,
                          width: 200,
                          color: const Color(0xff4A60E9),
                          child: const Center(
                            child: Text(
                                'Informasi Pasien',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                          child: Row(
                            children: const [
                              Text(
                                  'Nama Lengkap: ',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(
                                  'Belum diisi',
                                  style: TextStyle(fontSize: 16)
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                          child: Row(
                            children: const [
                              Text(
                                  'No. Telepon: ',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(
                                  'Belum diisi',
                                  style: TextStyle(fontSize: 16)
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                          child: Row(
                            children: const [
                              Text(
                                  'Alamat: ',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(
                                  'Belum diisi',
                                  style: TextStyle(fontSize: 16)
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                          child: Row(
                            children: const [
                              Text(
                                  'Umur: ',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(
                                  'Belum diisi',
                                  style: TextStyle(fontSize: 16)
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                          child: Row(
                            children: const [
                              Text(
                                  'Email: ',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(
                                  'Belum diisi',
                                  style: TextStyle(fontSize: 16)
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                          child: Row(
                            children: const [
                              Text(
                                  'Jenis Kelamin: ',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(
                                  'Belum diisi',
                                  style: TextStyle(fontSize: 16)
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0 , 20, 20, 10),
                          height: 40,
                          width: 200,
                          color: const Color(0xff4A60E9),
                          child: const Center(
                            child: Text(
                                'Kontak Darurat',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                          child: Row(
                            children: const [
                              Text(
                                  'Nama Lengkap: ',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(
                                  'Belum diisi',
                                  style: TextStyle(fontSize: 16)
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                          child: Row(
                            children: const [
                              Text(
                                  'Hubungan dengan Pasien: ',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(
                                  'Belum diisi',
                                  style: TextStyle(fontSize: 16)
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                          child: Row(
                            children: const [
                              Text(
                                  'Alamat: ',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(
                                  'Belum diisi',
                                  style: TextStyle(fontSize: 16)
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                          child: Row(
                            children: const [
                              Text(
                                  'No. Telepon: ',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(
                                  'Belum diisi',
                                  style: TextStyle(fontSize: 16)
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0 , 20, 20, 10),
                          height: 40,
                          width: 200,
                          color: const Color(0xff4A60E9),
                          child: const Center(
                            child: Text(
                                'Riwayat Kesehatan',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                          child: Row(
                            children: const [
                              Text(
                                  'Golongan Darah: ',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(
                                  'Belum diisi',
                                  style: TextStyle(fontSize: 16)
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                          child: Row(
                            children: const [
                              Text(
                                  'Tekanan Darah: ',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(
                                  'Belum diisi',
                                  style: TextStyle(fontSize: 16)
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                          child: Row(
                            children: const [
                              Text(
                                  'Riwayat Penyakit: ',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(
                                  'Belum diisi',
                                  style: TextStyle(fontSize: 16)
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                          child: Row(
                            children: const [
                              Text(
                                  'Riwayat Alergi: ',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(
                                  'Belum diisi',
                                  style: TextStyle(fontSize: 16)
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const PengaturanAkunPage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff4A60E9),
                                ),
                                child: const Text(
                                  'Kembali ke Pengaturan Akun',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            )
                          ],
                        )
                      ]
                  ),
                );
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Belum ada data akun.",
                        style: TextStyle(
                            color: Color(0xff59A5D8),
                            fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0 , 20, 20, 10),
                            height: 40,
                            width: 200,
                            color: const Color(0xff4A60E9),
                            child: const Center(
                              child: Text(
                                  'Informasi Pasien',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: const [
                                Text(
                                    'Nama Lengkap: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    'Name',
                                    style: TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: const [
                                Text(
                                    'No. Telepon: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    '08123456789',
                                    style: TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: const [
                                Text(
                                    'Alamat: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    'Address',
                                    style: TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: const [
                                Text(
                                    'Umur: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    'Age',
                                    style: TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: const [
                                Text(
                                    'Email: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    'user@gmail.com',
                                    style: TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: const [
                                Text(
                                    'Jenis Kelamin: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    'Gender',
                                    style: TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0 , 20, 20, 10),
                            height: 40,
                            width: 200,
                            color: const Color(0xff4A60E9),
                            child: const Center(
                              child: Text(
                                  'Kontak Darurat',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: const [
                                Text(
                                    'Nama Lengkap: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    'Name',
                                    style: TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: const [
                                Text(
                                    'Hubungan dengan Pasien: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    'Relationship',
                                    style: TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: const [
                                Text(
                                    'Alamat: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    'Address',
                                    style: TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: const [
                                Text(
                                    'No. Telepon: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    '08123456789',
                                    style: TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0 , 20, 20, 10),
                            height: 40,
                            width: 200,
                            color: const Color(0xff4A60E9),
                            child: const Center(
                              child: Text(
                                  'Riwayat Kesehatan',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: const [
                                Text(
                                    'Golongan Darah: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    'Bloodtype',
                                    style: TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: const [
                                Text(
                                    'Tekanan Darah: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    'Blood Pressure',
                                    style: TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: const [
                                Text(
                                    'Riwayat Penyakit: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    'Illnesses',
                                    style: TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: const [
                                Text(
                                    'Riwayat Alergi: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    'Allergies',
                                    style: TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => const PengaturanAkunPage()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff4A60E9),
                                  ),
                                  child: const Text(
                                    'Kembali ke Pengaturan Akun',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              )
                            ],
                          )
                        ]
                    ),
                  );
                }
              }
            }
        )
    );
  }
}