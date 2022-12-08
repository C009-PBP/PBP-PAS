//TODO: BUAT FETCHER JSON BMI
//STATUS: (MUNGKIN) UDAH
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:healthbud/main.dart';

import 'package:healthbud/model/bmi.dart';

import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:healthbud/page/authentication/LoginPage.dart';

class fetcherBMI {
  fetcherBMI();

  Future<List<BMI>> fetchBMI() async {
    var response1;
    try {
      response1 = await request.get("http://localhost:8000/auth/user-data");
      print(response1);
    } catch (e) {
      print("ERROr gan");
    }
    final user_pk = response1['pk'];
    var url = Uri.parse('http://localhost:8000/bmi_calculator/json-flutter/${user_pk}');

    var response;
    try {
      response = await http.get(
        url,
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json",
        },
      );
      print("GGGGGGGGG");
      print("ASOIPDJOSKAD");
      // print((utf8.decode(response.bodyBytes)));
    } catch (err) {
      print("axz");
    }

    print("O");
    // melakukan decode response menjadi bentuk json
    // print(json.encode(response)); --> error
    var data;
    try {
      data = jsonDecode(utf8.decode(response.bodyBytes)); //--> ERROR
    } catch (e) {
      print("askodaod");
    }
    print(data);

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
