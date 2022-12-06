//TODO: BUAT FETCHER JSON BMI
//STATUS: (MUNGKIN) UDAH


import 'package:http/http.dart' as http;
import 'dart:convert';



import 'package:healthbud/model/bmi.dart';

class fetcherBMI {
  fetcherBMI ();

  Future<List<BMI>> fetchBMI() async {
    var url = Uri.parse(
        'https://health-bud.up.railway.app/bmi_calculator/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(json.encode(utf8.decode(response.bodyBytes)));

    // melakukan konversi data json menjadi object MyWatchList
    List<BMI> listBMI = [];
    for (var d in data) {
      if (d != null) {
        listBMI.add(BMI.fromJson(d));
      }
    }

    return listBMI;
  }
}