import 'dart:convert';

import 'package:ARGUS/models/report.dart';
import 'package:ARGUS/utils.dart';
import 'package:http/http.dart' as http;

class ReportRepo {
  Future<Trash?> getReport(int id) async {
    http.Response response = await http.get(Uri.parse("$baseUrl/trash/$id"));
    if (response.statusCode == 200) {
      return Trash.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Trash>> getReports() async {
    http.Response response = await http.get(Uri.parse("$baseUrl/trash/all"));
    List<Trash> reports = [];

    print(response.body.runtimeType);
    
    Iterable l = json.decode(response.body);
    reports = List<Trash>.from(l.map((model)=> Trash.fromMap(model)));

    return reports;
  }
}
