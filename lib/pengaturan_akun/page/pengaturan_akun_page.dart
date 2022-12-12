import 'package:flutter/material.dart';
import 'package:healthbud/core/tools/drawer.dart';
import 'package:healthbud/pengaturan_akun/page/riwayat_kesehatan_page.dart';
import 'package:healthbud/pengaturan_akun/page/pengaturan_akun_form.dart';
import 'package:healthbud/pengaturan_akun/tools/fetch_akun.dart';
import 'package:healthbud/core/tools/loggedInUser.dart';

class PengaturanAkunPage extends StatefulWidget {
  const PengaturanAkunPage({super.key});

  @override
  State<PengaturanAkunPage> createState() => _PengaturanAkunPageState();
}

class _PengaturanAkunPageState extends State<PengaturanAkunPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pengaturan Akun'),
        ),
        drawer: DrawerClass(parentScreen: ScreenName.pengaturanAkun),
        body: FutureBuilder(
            future: fetchProfile(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return ListView (
                  children: [
                    Card(
                        margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                                        child: Text(
                                          "Belum Diisi",
                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) => const ProfileFormPage()),
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Wrap(
                                                children: [
                                                  const Icon(Icons.person_outline),
                                                  Text(
                                                    " ${loggedInUser?.username}",
                                                    style: const TextStyle(fontSize: 16),
                                                  ),
                                                ],
                                              )
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Wrap(
                                                children: const [
                                                  Icon(Icons.markunread_outlined),
                                                  Text(
                                                    " Belum Diisi",
                                                    style: TextStyle(fontSize: 16),
                                                  ),
                                                ],
                                              )
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Wrap(
                                                children: const [
                                                  Icon(Icons.calendar_month_outlined),
                                                  Text(
                                                    " Belum Diisi",
                                                    style: TextStyle(fontSize: 16),
                                                  ),
                                                ],
                                              )
                                          ),
                                        ],
                                      ),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Wrap(
                                                children: [
                                                  const Icon(Icons.account_circle_outlined),
                                                  Text(
                                                    " ${loggedInUser?.role}",
                                                    style: const TextStyle(fontSize: 16),
                                                  ),
                                                ],
                                              )
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Wrap(
                                                children: const [
                                                  Icon(Icons.wc_outlined),
                                                  Text(
                                                    " Belum Diisi",
                                                    style: TextStyle(fontSize: 16),
                                                  ),
                                                ],
                                              )
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Wrap(
                                                children: const [
                                                  Icon(Icons.location_on_outlined),
                                                  Text(
                                                    " Belum Diisi",
                                                    style: TextStyle(fontSize: 16),
                                                  ),
                                                ],
                                              )
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ]
                            )
                        )
                    ),
                    Card(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "Riwayat Kesehatan",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => const RiwayatKesehatanPage()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xff4A60E9),
                                      ),
                                      child: const Text('Lihat Riwayat Kesehatan')
                                  ),
                                ),
                              ]
                          )
                      ),
                    ),
                  ],
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
                  return ListView (
                    children: [
                      Card(
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                                          child: Text(
                                            "${snapshot.data![0].fields.firstName} ${snapshot.data![0].fields.lastName}",
                                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(builder: (context) => const ProfileFormPage()),
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
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Expanded(
                                              child: Wrap(
                                                children: [
                                                  const Icon(Icons.person_outline),
                                                  Text(
                                                    " ${loggedInUser!.username}",
                                                    style: const TextStyle(fontSize: 16),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            )
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Expanded(
                                              child: Wrap(
                                                children: [
                                                  const Icon(Icons.markunread_outlined),
                                                  Text(
                                                    " ${snapshot.data![0].fields.email}",
                                                    style: const TextStyle(fontSize: 16),
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                ],
                                              ),
                                            )
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Expanded(
                                              child: Wrap(
                                                children: const [
                                                  Icon(Icons.calendar_month_outlined),
                                                  Text(
                                                    " DOB",
                                                    style: TextStyle(fontSize: 16),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            )
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Expanded(
                                              child: Wrap(
                                                children: [
                                                  const Icon(Icons.account_circle_outlined),
                                                  Text(
                                                      " ${loggedInUser!.role}",
                                                      style: const TextStyle(fontSize: 16),
                                                      overflow: TextOverflow.fade
                                                  ),
                                                ],
                                              ),
                                            )
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Expanded(
                                              child: Wrap(
                                                children: [
                                                  const Icon(Icons.wc_outlined),
                                                  Text(
                                                      " ${snapshot.data![0].fields.gender}",
                                                      style: const TextStyle(fontSize: 16),
                                                      overflow: TextOverflow.fade
                                                  ),
                                                ],
                                              ),
                                            )
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Expanded(
                                              child: Wrap(
                                                children: [
                                                  const Icon(Icons.location_on_outlined),
                                                  Text(
                                                    " ${snapshot.data![0].fields.city}, ${snapshot.data![0].fields.province}",
                                                    style: const TextStyle(fontSize: 16),
                                                    overflow: TextOverflow.fade,
                                                  ),
                                                ],
                                              ),
                                            )
                                        ),
                                      ],
                                    ),
                                  ]
                              )
                          )
                      ),
                      Card(
                        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "Riwayat Kesehatan",
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => const RiwayatKesehatanPage()),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xff4A60E9),
                                        ),
                                        child: const Text('Lihat Riwayat Kesehatan')
                                    ),
                                  ),
                                ]
                            )
                        ),
                      ),
                    ],
                  );
                }
              }
            }
        )
    );
  }
}