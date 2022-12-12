import 'package:flutter/material.dart';
import 'package:healthbud/info_dokter/page/review_dokter_page.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import '../../core/tools/drawer.dart';
import '../model/info_dokter.dart';
import '../model/review_dokter.dart';
import '../tools/fetcherInfoDokter.dart';
import '../widgets/info_dokter_card.dart';

class InfoDokterPage extends StatefulWidget {
  const InfoDokterPage({Key? key}) : super(key: key);

  @override
  State<InfoDokterPage> createState() => _InfoDokterPageState();
}

class _InfoDokterPageState extends State<InfoDokterPage> {
  List<InfoDokter> listInfoDokter = [];
  List<ReviewDokter> listReviewDokter = [];
  var request;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Info Dokter"),
      ),
      drawer: const DrawerClass(parentScreen: ScreenName.Info_Dokter),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<InfoDokter>>(
                  future: getInfoDokter(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          InfoDokter list = snapshot.data![index];
                          return InfoDokterCard(
                            infoDokter: list,
                            index: index,
                            lastIndex: snapshot.data!.length,
                            listReviewDokter: listReviewDokter
                                .where((pk) => pk.fields!.dokter == list.pk)
                                .toList(),
                          );
                        },
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - (2 * 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff0d6efd)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ))),
                  onPressed: () async {
                    if (listInfoDokter.isNotEmpty) {
                      if (request.loggedIn) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReviewDokterPage(
                                    infoDokter: listInfoDokter)));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Silahkan login terlebih dahulu"),
                        ));
                      }
                    }
                  },
                  child: Text(
                    'Add Review',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<InfoDokter>> getInfoDokter() async {
    var jsonMap = await FetcherInfoDokter().getInfoDokter();
    for (int i = 0; i < jsonMap.length; i++) {
      InfoDokter infoDokter = InfoDokter.fromJson(jsonMap[i]);
      listInfoDokter.add(infoDokter);
    }
    var jsonMap2 = await FetcherInfoDokter().getReviewDokter(15);
    for (int i = 0; i < jsonMap2.length; i++) {
      ReviewDokter reviewDokter = ReviewDokter.fromJson(jsonMap2[i]);
      listReviewDokter.add(reviewDokter);
    }
    return listInfoDokter;
  }
}
