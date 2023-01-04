import 'dart:convert';

import 'package:covid_19_tracker_app/models/covid_case_model.dart';
import 'package:http/http.dart' as http;

class CovidAPIHelper {
  CovidAPIHelper._();
  static final CovidAPIHelper covidAPIHelper = CovidAPIHelper._();

  String api = "https://api.covid19api.com/summary";

  Future<CovidCase?> fetchAllData() async {
    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);

      CovidCase covidCase = CovidCase.fromMap(data: decodedData);

      return covidCase;
    }

    return null;
  }
}
