import 'package:http/http.dart' as http;

import 'dart:convert';

import '../../core/tools/loggedInUser.dart';
import '../models/post_model.dart';

Future<List<Fields>> fetchQuestion() async {
  final userPk = loggedInUser!.pk;
  var url = Uri.parse('http://health-bud.up.railway.app/tanya_dokter/json-all/$userPk');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

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
