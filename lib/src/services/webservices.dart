import 'dart:convert';

import 'package:covid_statistics_app/src/model/country_wise_model.dart';
import 'package:covid_statistics_app/src/model/india_state_wise_model.dart';
import 'package:http/http.dart' as http;

const url = "https://corona-virus-world-and-india-data.p.rapidapi.com/api";
const apiKey = "6b43206931mshf9b4796cc4700afp139455jsned3f9fd23fa0";
const indianUrl =
    "https://coronavirus-tracker-india-covid-19.p.rapidapi.com/api/getStatewise";

const indianApiKey = "36a90e3068msh721952ece2bd9cdp1a027bjsnf54908d7164c";

class WebService {
  Future<List<CountriesStat>> getWorldStatics() async {
    final response = await http.get(
      url,
      headers: {
        "x-rapidapi-key": "$apiKey",
      },
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body['countries_stat'];
      return json.map((e) => CountriesStat.fromJson(e)).toList();
    } else {
      throw Exception("error occured");
    }
  }

  Future<List<IndiaStateModel>> getIndiaStatics() async {
    final response = await http.get(
      indianUrl,
      headers: {
        "x-rapidapi-key": "$indianApiKey",
      },
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body;
      return json.map((e) => IndiaStateModel.fromJson(e)).toList();
    } else {
      throw Exception("error occured");
    }
  }
}
