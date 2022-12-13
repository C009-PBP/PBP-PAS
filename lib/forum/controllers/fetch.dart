import 'package:healthbud/core/tools/loggedInUser.dart';
import 'package:healthbud/forum/models/post_model.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';


Future<List<Fields>> fetchQuestion() async {
  //print("ok");
  final userPk = loggedInUser!.pk;
  //print(userPk);
  var url = Uri.parse('https://health-bud.up.railway.app/tanya_dokter/json-all/$userPk');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  //print("ya");
  //print(response);
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Fields> listQuestion = [];
  for (var d in data) {
    if (d != null) {
      print(d);
      listQuestion.add(Fields.fromJson(d));
    }
  }

  return listQuestion;
}
