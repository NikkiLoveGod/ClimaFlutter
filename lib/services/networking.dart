import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Networking {
  Networking({@required this.url});

  final String url;

  Future get() async {
    http.Response response = await http.get(this.url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(
        '[Status: ${response.statusCode}]: Could not fetch data from ${this.url} :(',
      );
    }
  }
}
