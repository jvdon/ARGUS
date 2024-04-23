import 'dart:convert';

import 'package:ARGUS/models/report.dart';
import 'package:ARGUS/utils.dart';
import 'package:http/http.dart' as http;

class ReportRepo {
  Future<Report?> getReport(int id) async {
    http.Response response = await http.get(Uri.parse("$baseUrl/trash/$id"));
    if (response.statusCode == 200) {
      return Report.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<Report>> getReports() async {
    http.Response response = await http.get(Uri.parse("$baseUrl/trash/all"));
    List<Report> reports = [];

    print(response.body.runtimeType);

    Iterable l = json.decode(response.body);
    reports = List<Report>.from(l.map((model) => Report.fromMap(model)));

    return reports;
  }
}
