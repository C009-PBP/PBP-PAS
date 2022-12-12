import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthbud/info_dokter/page/info_dokter_page.dart';
import 'package:http/http.dart' as http;
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class FetcherInfoDokter {
  String rootUrlDev = "https://health-bud.up.railway.app";

  getInfoDokter() async {
    Uri uri = Uri.parse('$rootUrlDev/info_dokter/json');
    var result = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    if (result.statusCode == 200) {
      var jsonString = result.body;
      var jsonMap = json.decode(jsonString);
      return jsonMap;
    }
  }

  getReviewDokter(int idUser) async {
    Uri uri = Uri.parse('$rootUrlDev/info_dokter/json-flutter/15');
    var result = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    if (result.statusCode == 200) {
      var jsonString = result.body;
      var jsonMap = json.decode(jsonString);
      print(jsonMap);
      return jsonMap;
    }
  }

  addReview(
      BuildContext context, var request, String idDokter, String review) async {
    var result = await request.post(
      "https://health-bud.up.railway.app/info_dokter/add_flutter/",
      {
        'Pilih Dokter': idDokter,
        'Review': review,
      },
    );
    if (result['status'] = true) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Add review berhasil!"),
      ));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => InfoDokterPage()));
    }
  }
}
