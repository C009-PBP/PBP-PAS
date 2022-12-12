import 'package:flutter/material.dart';
import 'package:healthbud/core/tools/drawer.dart';
import 'package:healthbud/pengaturan_akun/page/kontak_darurat_form.dart';
import 'package:healthbud/pengaturan_akun/page/pengaturan_akun_page.dart';
import 'package:healthbud/pengaturan_akun/page/riwayat_kesehatan_form.dart';
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
        drawer: const DrawerClass(parentScreen: ScreenName.riwayatKesehatan),
        body: FutureBuilder(
            future: fetchProfile(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
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
                            padding: const EdgeInsets.all(8),
                            height: 40,
                            width: 220,
                            color: const Color(0xff4A60E9),
                            child: const Text(
                                'Informasi Pasien',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: [
                                const Text(
                                    'Nama Lengkap: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                                ),
                                Text(
                                    snapshot.data![0].fields.firstName != null?
                                    "${snapshot.data![0].fields.firstName} ${snapshot.data![0].fields.lastName}" : "Belum Diisi",
                                    style: const TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: [
                                const Text(
                                    'No. Telepon: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    snapshot.data![0].fields.phoneNo != null?
                                    '${snapshot.data![0].fields.phoneNo}' : 'Belum Diisi',
                                    style: const TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: [
                                const Text(
                                    'Alamat: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    snapshot.data![0].fields.province != null?
                                    "${snapshot.data![0].fields.city}, ${snapshot.data![0].fields.province}" : "Belum Diisi",
                                    style: const TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: [
                                const Text(
                                    'Tanggal Lahir: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    snapshot.data![0].fields.birthDate != null?
                                    "${snapshot.data![0].fields.birthDate}" : "Belum Diisi",
                                    style: const TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: [
                                const Text(
                                    'Email: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    snapshot.data![0].fields.email != null?
                                    "${snapshot.data![0].fields.email}" : 'Belum Diisi',
                                    style: const TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: [
                                const Text(
                                    'Jenis Kelamin: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    snapshot.data![0].fields.gender != null?
                                    "${snapshot.data![0].fields.gender}" : "Belum Diisi",
                                    style: const TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0 , 20, 20, 10),
                                padding: const EdgeInsets.all(8),
                                height: 40,
                                width: 220,
                                color: const Color(0xff4A60E9),
                                child: const Text(
                                    'Kontak Darurat',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => const EmergencyFormPage()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff4A60E9),
                                  ),
                                  child: const Icon(Icons.edit),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: [
                                const Text(
                                    'Nama Lengkap: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    snapshot.data![0].fields.emergencyFirstname != null?
                                    '${snapshot.data![0].fields.emergencyFirstname} ${snapshot.data![0].fields.emergencyLastname}' : 'Belum Diisi',
                                    style: const TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: [
                                const Text(
                                    'Hubungan dengan Pasien: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    snapshot.data![0].fields.emergencyRelationship != null?
                                    '${snapshot.data![0].fields.emergencyRelationship}' : 'Belum Diisi',
                                    style: const TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: [
                                const Text(
                                    'Alamat: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    snapshot.data![0].fields.emergencyProvince != null?
                                    '${snapshot.data![0].fields.emergencyStreet}, ${snapshot.data![0].fields.emergencyCity}, ${snapshot.data![0].fields.emergencyProvince}' : 'Belum Diisi',
                                    style: const TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: [
                                const Text(
                                    'No. Telepon: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    snapshot.data![0].fields.emergencyPhoneNo != null?
                                    '${snapshot.data![0].fields.emergencyPhoneNo}' : 'Belum Diisi',
                                    style: const TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0 , 20, 20, 10),
                                padding: const EdgeInsets.all(8),
                                height: 40,
                                width: 220,
                                color: const Color(0xff4A60E9),
                                child: const Text(
                                    'Riwayat Kesehatan',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => const RiwayatFormPage()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff4A60E9),
                                  ),
                                  child: const Icon(Icons.edit),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: [
                                const Text(
                                    'Golongan Darah: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    snapshot.data![0].fields.bloodtype != null?
                                    '${snapshot.data![0].fields.bloodtype}' : 'Belum Diisi',
                                    style: const TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: [
                                const Text(
                                    'Tekanan Darah: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    snapshot.data![0].fields.bloodpressure != null?
                                    '${snapshot.data![0].fields.bloodpressure}' : 'Belum Diisi',
                                    style: const TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: [
                                const Text(
                                    'Riwayat Penyakit: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    snapshot.data![0].fields.illnesses != null?
                                    '${snapshot.data![0].fields.illnesses}' : 'Belum Diisi',
                                    style: const TextStyle(fontSize: 16)
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                            child: Row(
                              children: [
                                const Text(
                                    'Riwayat Alergi: ',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text(
                                    snapshot.data![0].fields.allergies != null?
                                    '${snapshot.data![0].fields.allergies}' : 'Belum Diisi',
                                    style: const TextStyle(fontSize: 16)
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