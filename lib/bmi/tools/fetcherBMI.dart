//TODO: BUAT FETCHER JSON BMI
//STATUS: (MUNGKIN) UDAH
import 'package:flutter/material.dart';
import 'package:healthbud/core/tools/loggedInUser.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:healthbud/main.dart';

import 'package:healthbud/bmi/model/bmi.dart';

import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:healthbud/authentication/page/LoginPage.dart';

class fetcherBMI {
  fetcherBMI();

  Future<List<BMI>> fetchBMI() async {
    
    final user_pk = loggedInUser!.pk;
    var url = Uri.parse('https://health-bud.up.railway.app/bmi_calculator/json-flutter/${user_pk}');

    var response;
    try {
      response = await http.get(
        url,
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json",
        },
      );
      // print((utf8.decode(response.bodyBytes)));
    } catch (err) {
      print("axz");
    }

    // print("O");
    // melakukan decode response menjadi bentuk json
    // print(json.encode(response)); --> error
    var data;
    try {
      data = jsonDecode(utf8.decode(response.bodyBytes)); 
    } catch (e) {
      print("askodaod");
    }
    // print(data);

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
