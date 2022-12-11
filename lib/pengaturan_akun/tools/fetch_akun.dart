import 'package:healthbud/pengaturan_akun/model/akun.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Profile>> fetchProfile() async {
  var url = Uri.parse('https://health-bud.up.railway.app/pengaturan_akun/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object MyWatchList
  List<Profile> listProfile = [];
  for (var d in data) {
    if (d != null) {
      listProfile.add(Profile.fromJson(d));
    }
  }

  return listProfile;
}