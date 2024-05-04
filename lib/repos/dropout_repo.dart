import 'dart:convert';

import 'package:ARGUS/models/dropout.dart';
import 'package:ARGUS/utils.dart';
import 'package:http/http.dart' as http;

class DropoutRepo {
  Future<Dropout?> getDropout(int id) async {
    http.Response response = await http.get(Uri.parse("$baseUrl/depot/$id"));
    if (response.statusCode == 200) {
      return Dropout.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Dropout>> getDropouts() async {
    http.Response response = await http.get(Uri.parse("$baseUrl/depot/all"));
    List<Dropout> reports = [];

    Iterable l = json.decode(response.body);
    reports = List<Dropout>.from(l.map((model) => Dropout.fromMap(model)));

    return reports;
  }
}
