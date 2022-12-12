//TODO: BUAT FETCHER JSON BMI
//STATUS: (MUNGKIN) UDAH
import 'package:flutter/material.dart';
import 'package:healthbud/core/tools/loggedInUser.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


import 'package:healthbud/homepage/model/homepage_review.dart';

import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:healthbud/authentication/page/LoginPage.dart';

class fetcherHomepage {
  fetcherHomepage();

  Future<List<Homepage>> fetchHomepage() async {
    final user_pk = loggedInUser!.pk;
    var url = Uri.parse('https://health-bud.up.railway.app/json');
    // var url = Uri.parse('http://localhost:8000/json');

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
    List<Homepage> listHomepage = [];
    for (var d in data) {
      if (d != null) {
        listHomepage.add(Homepage.fromJson(d));
      }
    }

    return listHomepage;
  }
}
